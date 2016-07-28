package main.model.teacherexamine;

import main.datamodel.objects.ExamineHistoryTeacher;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String args[]){
        String mail_address = "1401139@st.asojuku.ac.jp";
        List<ExamineHistoryTeacher> result = new ArrayList<>();
        TeacherExamine te = new TeacherExamine();

        result = te.student_select(mail_address);

        for(ExamineHistoryTeacher r : result){
            System.out.print(r.class_id);
            System.out.print(r.class_name);
            System.out.print(r.mail);
            System.out.print(r.name);
            System.out.println(r.examine_name);
        }
    }
}
