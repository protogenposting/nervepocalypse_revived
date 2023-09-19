/// @description Insert description here
// You can write your code in this editor
instance_destroy(player)
rollback_define_input(
{
        left: ord("A"),
        right: ord("D"),
        up: vk_space,
		glide: ord("E"),
        mb_x: m_axisx,
        mb_y: m_axisy,
        fire: mb_left,
		dash: vk_shift
});

rollback_define_player(playermult, "Instances");

if (!rollback_join_game())
{
        rollback_create_game(get_integer("how many players?",2), false);
}