Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53210EC
	for <llvm@lists.linux.dev>; Sat,  4 Jun 2022 02:20:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id r129so4868076wmr.3
        for <llvm@lists.linux.dev>; Fri, 03 Jun 2022 19:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HGkjSRozKyvgRElWJ1LnFEFfbG7jMHZRo7WjZyuEArk=;
        b=D3ZulesEjRq6EtfnnC3EfYOYsnGQ0d1aNNvKJnneSfmNQraJIAzlkUjXPChEiYRGjK
         Z1ufCeO3eSvIpA6xZFFdqkYv513ehaFPsVsTfdwgNU2CSFfLwkpXWEWsgulaEIZ2Zv1P
         3tA5EOQLkUmKOANg9p/l2/a5RkHHbfMPIuPDyzVqJK+e0WPA56AfvzBEC+IISnmA3fwS
         Rn9MIOmgk+tDa97oCMI2h02LhZutDwG/1Tnmb1JTLX/zBZhXEuuWDlYhCZPsOvz8GRF7
         fEyAxwGXT1jx0iRq4SpUeCNQRURViMvZeVAP4XVL4le4tOuFGm7ZQExw0qkCkvQAmTF9
         NhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HGkjSRozKyvgRElWJ1LnFEFfbG7jMHZRo7WjZyuEArk=;
        b=nc+UeI7EffTA2kbkfmvnIWRnlkWbXjA+dv7Fm9B9ijsGXBBGoVbeJil4Qp26UNrV07
         IZbA5sdH+blKcdMECrW8vVZhfa0SbIlTogzOir5QLr8jcwrGshtMeze7XKKNqo4C7hTf
         T6MMz/XjSSv4j2xxI+SVlvlTWh0LvWmjp0KbIj+SfziFd/WyyyKVqkuw7fWeqXULKp6F
         ByeOZEx3ifEIDbzQY7OHMcWrp7+wjP1BfNyC53qR4jUeBjO14+m297xABOCF3pqWM6j1
         eRQrPJiUbK56BzPrsNOxKxa9Cp4OIC2DxGUW3P+Ew3lKjEPjBogZJPgB2mkfZR/K67Td
         Jl8A==
X-Gm-Message-State: AOAM532s+gerLI0/MPDa7HlCvHziUeAPP1a2MGABoMJgtQfIDAqOlvZR
	KFRfqEWECJ3p13i8zIE1MKlUQiRIH6NN/zI3abk=
X-Google-Smtp-Source: ABdhPJwhgVPSvdOc/PgImXhUPya+FwaBih09OroVWIiiA3VNyTFWjDGXyOVd4bO0fmA/qjfVNvYplVNxUPkUvzE3C/U=
X-Received: by 2002:a05:600c:285:b0:395:b9bf:57 with SMTP id
 5-20020a05600c028500b00395b9bf0057mr40918706wmk.21.1654309204503; Fri, 03 Jun
 2022 19:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220602164518.286295-2-xiehuan09@gmail.com> <202206030515.4lqqkb3W-lkp@intel.com>
 <CAEr6+ED6oJV1BmAQy6T592GX751t9QB==0vWcXUDMw3WL0YWtA@mail.gmail.com> <YpoqulzEvwNDHFMH@dev-arch.thelio-3990X>
In-Reply-To: <YpoqulzEvwNDHFMH@dev-arch.thelio-3990X>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Sat, 4 Jun 2022 10:19:52 +0800
Message-ID: <CAEr6+EC7w0Y0Fvf+2fj7D56rHB56e3axTo8xuvNhxkU2ex9UaQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] trace: Add trace any kernel object
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Steven Rostedt <rostedt@goodmis.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, mingo@redhat.com, 
	Masami Hiramatsu <mhiramat@kernel.org>, Tom Zanussi <zanussi@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Nathan,

On Fri, Jun 3, 2022 at 11:37 PM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> On Fri, Jun 03, 2022 at 09:48:07AM +0800, Jeff Xie wrote:
> > Hi lkp,
> >
> > On Fri, Jun 3, 2022 at 5:12 AM kernel test robot <lkp@intel.com> wrote:
> > >
> > > Hi Jeff,
> > >
> > > Thank you for the patch! Perhaps something to improve:
> > >
> > > [auto build test WARNING on b39181f7c6907dc66ff937b74758671fa6ba430c]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Xie/trace=
-Introduce-objtrace-trigger-to-trace-the-kernel-object/20220603-004723
> > > base:   b39181f7c6907dc66ff937b74758671fa6ba430c
> > > config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive=
/20220603/202206030515.4lqqkb3W-lkp@intel.com/config)
> > > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project =
b364c76683f8ef241025a9556300778c07b590c2)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://github.com/intel-lab-lkp/linux/commit/765253f020469=
f94856aedc5a3fe5444e1e8f4e8
> > >         git remote add linux-review https://github.com/intel-lab-lkp/=
linux
> > >         git fetch --no-tags linux-review Jeff-Xie/trace-Introduce-obj=
trace-trigger-to-trace-the-kernel-object/20220603-004723
> > >         git checkout 765253f020469f94856aedc5a3fe5444e1e8f4e8
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/gpu/drm/qxl/ ke=
rnel/trace/
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> kernel/trace/trace_object.c:336:61: warning: format specifies type=
 'long' but the argument has type 'unsigned int' [-Wformat]
> > >                    pr_err("the size of the %s should be:%ld\n", field=
->name, sizeof(void *));
> > >                                                         ~~~          =
        ^~~~~~~~~~~~~~
> > >                                                         %u
> >
> > I will  double check it ,the sizeof(void *) on x86_64 is type =E2=80=98=
long
> > unsigned int=E2=80=99.
>
> Per Documentation/core-api/printk-formats.rst, sizeof returns size_t,
> which should use the %zu specifier.

This is great, Thank you for your reminder ;-)

> Cheers,
> Nathan
>
> > >    include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
> > >            printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
> > >                                   ~~~     ^~~~~~~~~~~
> > >    include/linux/printk.h:446:60: note: expanded from macro 'printk'
> > >    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_AR=
GS__)
> > >                                                        ~~~    ^~~~~~~=
~~~~
> > >    include/linux/printk.h:418:19: note: expanded from macro 'printk_i=
ndex_wrap'
> > >                    _p_func(_fmt, ##__VA_ARGS__);                     =
      \
> > >                            ~~~~    ^~~~~~~~~~~
> > >    1 warning generated.
> > >
> > >
> > > vim +336 kernel/trace/trace_object.c
> > >
> > >    297
> > >    298  static int
> > >    299  event_object_trigger_parse(struct event_command *cmd_ops,
> > >    300                         struct trace_event_file *file,
> > >    301                         char *glob, char *cmd, char *param_and=
_filter)
> > >    302  {
> > >    303          struct event_trigger_data *trigger_data;
> > >    304          struct objtrace_trigger_data *obj_data;
> > >    305          struct ftrace_event_field *field;
> > >    306          char *objtrace_cmd, *arg;
> > >    307          char *param, *filter;
> > >    308          int ret;
> > >    309          bool remove;
> > >    310
> > >    311          remove =3D event_trigger_check_remove(glob);
> > >    312
> > >    313          /*
> > >    314           * separate the param and the filter:
> > >    315           * objtrace:add:OBJ[:COUNT] [if filter]
> > >    316           */
> > >    317          ret =3D event_trigger_separate_filter(param_and_filte=
r, &param, &filter, true);
> > >    318          if (ret)
> > >    319                  return ret;
> > >    320
> > >    321          objtrace_cmd =3D strsep(&param, ":");
> > >    322          if (!objtrace_cmd || strcmp(objtrace_cmd, OBJTRACE_CM=
D_ADD)) {
> > >    323                  pr_err("error objtrace command\n");
> > >    324                  return -EINVAL;
> > >    325          }
> > >    326
> > >    327          arg =3D strsep(&param, ":");
> > >    328          if (!arg)
> > >    329                  return -EINVAL;
> > >    330
> > >    331          field =3D trace_find_event_field(file->event_call, ar=
g);
> > >    332          if (!field)
> > >    333                  return -EINVAL;
> > >    334
> > >    335          if (field->size !=3D sizeof(void *)) {
> > >  > 336                  pr_err("the size of the %s should be:%ld\n", =
field->name, sizeof(void *));
> > >    337                  return -EINVAL;
> > >    338          }
> > >    339
> > >    340          if (remove && !field_exist(file, cmd_ops, field->name=
))
> > >    341                  return -ENOENT;
> > >    342
> > >    343          obj_data =3D kzalloc(sizeof(*obj_data), GFP_KERNEL);
> > >    344          if (!obj_data)
> > >    345                  return -ENOMEM;
> > >    346
> > >    347          obj_data->field =3D field;
> > >    348          obj_data->tr =3D file->tr;
> > >    349          snprintf(obj_data->objtrace_cmd, OBJTRACE_CMD_LEN, ob=
jtrace_cmd);
> > >    350
> > >    351          trigger_data =3D event_trigger_alloc(cmd_ops, cmd, pa=
ram, obj_data);
> > >    352          if (!trigger_data) {
> > >    353                  kfree(obj_data);
> > >    354                  return -ENOMEM;
> > >    355          }
> > >    356          if (remove) {
> > >    357                  event_trigger_unregister(cmd_ops, file, glob+=
1, trigger_data);
> > >    358                  kfree(obj_data);
> > >    359                  kfree(trigger_data);
> > >    360                  return 0;
> > >    361          }
> > >    362
> > >    363          ret =3D event_trigger_parse_num(param, trigger_data);
> > >    364          if (ret)
> > >    365                  goto out_free;
> > >    366
> > >    367          ret =3D event_trigger_set_filter(cmd_ops, file, filte=
r, trigger_data);
> > >    368          if (ret < 0)
> > >    369                  goto out_free;
> > >    370
> > >    371          ret =3D event_trigger_register(cmd_ops, file, glob, t=
rigger_data);
> > >    372          if (ret)
> > >    373                  goto out_free;
> > >    374
> > >    375          return ret;
> > >    376
> > >    377   out_free:
> > >    378          event_trigger_reset_filter(cmd_ops, trigger_data);
> > >    379          kfree(obj_data);
> > >    380          kfree(trigger_data);
> > >    381          return ret;
> > >    382  }
> > >    383
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://01.org/lkp
> >
> > Thanks,
> > JeffXie
> >
Thanks,
JeffXie
