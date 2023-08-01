package services;

import models.Player;
import models.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import repositories.PlayerRepository;
import repositories.TeamRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TeamService {
    @Autowired
    private TeamRepository teamRepository;

    @Autowired
    private PlayerRepository playerRepository;

    // ======FULL CRUD ======

    // READ ALL
    public List<Team> allTeams() {
        return teamRepository.findAllByOrderByTeamNameAsc();
    }

    // CREATE
    public Team createTeam(Team team, BindingResult result) {
        Optional<Team> toCreateTeam = teamRepository.findByTeamName(team.getTeamName());
        if (toCreateTeam.isPresent()) {
            result.rejectValue("teamName","create team error", "Team name already exists");
        }
        if (result.hasErrors()) {
            return null;
        }
        return teamRepository.save(team);

    }

    // READ ONE
    public Team findTeam(Long id) {
        Optional<Team> optionalTeam = teamRepository.findById(id);

        if (optionalTeam.isPresent()) {
            return optionalTeam.get();
        } else {
            return null;
        }
    }

    // UPDATE
    public Team updateTeam(Team team) {
        Team updateTeam = teamRepository.save(team);
        return updateTeam;
    }

    // DELETE //deleteById returns void thats why void method
    public void deleteTeam(Long id) {
        List<Player> players = this.findTeam(id).getPlayers();
        for (int i = 0; i < players.size(); i++) {
            playerRepository.deleteById(players.get(i).getId());
        }
        teamRepository.deleteById(id);
    }

    // CREATE PLAYER
    public Player createPlayer(Player player, BindingResult result) {
        if (player.getTeam().getPlayers().size() == 9) {
            result.rejectValue("playerName", "Create player error", "Team is full");
            return null;
        }
        if (result.hasErrors()) {
            return null;
        }
        return playerRepository.save(player);
    }

    public Optional<Player> findTeamById(Long id) {
        return playerRepository.findById(id);
    }

}
