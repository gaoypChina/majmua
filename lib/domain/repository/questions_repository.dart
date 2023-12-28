import '../entities/question_entity.dart';
import '../entities/question_footnote_entity.dart';

abstract class QuestionsRepository {
  Future<List<QuestionEntity>> getAllQuestions();

  Future<List<QuestionEntity>> getQuestionById({required int questionId});

  Future<QuestionFootnoteEntity> getFootnoteById({required int footnoteId});
}