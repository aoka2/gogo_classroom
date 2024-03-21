package Model;

public class messageLike{
	public static void Like(Message ms) {
		ms.setLike(ms.getLike() + 1);
	}
	public static void Dislike(Message ms) {
		ms.setDislike(ms.getDislike() + 1);
	}
}