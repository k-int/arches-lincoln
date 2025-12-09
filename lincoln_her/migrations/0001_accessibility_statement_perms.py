from django.db import migrations, models
from django.utils.translation import gettext as _


class Migration(migrations.Migration):

    dependencies = [("arches_her", "0001_initial")]

    add_accessibility_statement_perms = """
        insert into guardian_groupobjectpermission (
            object_pk,
            content_type_id,
            group_id,
            permission_id)
        values (
            '8688eaf9-3605-4384-823c-d01c0d210f82',
            51,
            8,
            205);
    """

    remove_accessibility_statement_perms = """
        delete from guardian_groupobjectpermission where 
        object_pk = '8688eaf9-3605-4384-823c-d01c0d210f82' and
        content_type_id = 51 and
        group_id = 8 and
        permission_id = 205;
    """

    operations = [
        migrations.RunSQL(
            add_accessibility_statement_perms,
            remove_accessibility_statement_perms,
        ),
    ]