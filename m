Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B3320E
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 21:35:18 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id j5-20020a05600c1c0500b0039c5dbbfa48so844722wms.5
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 14:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=idUSaa8gwuIihbYaNise3w2YYlg1vymPz92K2rveSzI=;
        b=wY3H2AQEuie1/H+ZQCrqw2Ym3cijoyGcBYEMvPGe9A5rikiCwOacYWiEdL3NyP2w2Z
         eo04kdxyDvMIkeOR8ujpECEK+FXPvIxUMUxtKiUtBXfofJPtpFLoJ4GQBvP5bdRV6ldz
         0XH1WzwMyYxol5CWC5TZWoNr2ATnRQGkvcEd67Edp2p18nOBHXNf6yjZs+Z3OiCLPevD
         L7NiIsh2CW/Ic9meQ5kHtpnf29EwRNoD37iX3W4eMu2QmBkJ1tv5gtPh/ilPDuk5p8WY
         yiLsWJNV7zvgdxEZWcei+KFmjz3ac/StH0E7gjzcUS0y/83flr16hMuMDLYCT8OMcRIu
         qEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=idUSaa8gwuIihbYaNise3w2YYlg1vymPz92K2rveSzI=;
        b=1hsYR/bcK17vvtBwzhmar5WagyMQYZsP/sOtAH9Q1fIUXkzBbDwN7N4OrAsI7HYi1X
         KPmJkeb0MJNa2rG6u7YoBq4SdETyWHQiNfHanC3Ir56mvV9bDpxHU/X+eKZu2x2z687M
         kNWW+xC/sRud3eEmThTb/vwsy/nR77Q2MscUcYKUiTwRmLaRgEtfYwSff2bJtfrMcmqT
         nwFRKVsb4C84RrjbO9pTFWpZ+mYSY/x2i+JTFdU7ROU2MAh/se6+aF8kKhrySA5BNpYg
         eFjIBAA1rqnb7m4RDTw8OVFTu5dyh0Pu27xuiTMbocIjJ+uaZ8Z5855fBDl91IfrH3Y6
         uOsw==
X-Gm-Message-State: AOAM531MovbudweOztZRdi+bbSpolWB/8Tg9tVsm/SKyQ4HNhOLCPpGg
	fsVHh8Frc1SavOhzbr2gaw9MGcsDHAuafD2rYJcQ
X-Google-Smtp-Source: ABdhPJzzLkpNybysE8NlMkiaHbeXlwUKDCOTZfOlVYt3X5t6eWLvpTTJqqVFNh7+BVmCLhqfAO1qp23jQiYri0wULZ4=
X-Received: by 2002:a05:600c:4e16:b0:397:6d34:76a4 with SMTP id
 b22-20020a05600c4e1600b003976d3476a4mr31706600wmq.0.1654637716853; Tue, 07
 Jun 2022 14:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217142133.72205-1-cgzones@googlemail.com>
 <20220217142133.72205-4-cgzones@googlemail.com> <CAHC9VhRatc13ZsBSsjZeGtBfz0ouUGL9n0LTjbQtuZtYv2M43w@mail.gmail.com>
 <CAKwvOdkpA-P5763rt39q4HRjOdqC2Ca_Wu4suHU-qxpz3FkO8Q@mail.gmail.com>
In-Reply-To: <CAKwvOdkpA-P5763rt39q4HRjOdqC2Ca_Wu4suHU-qxpz3FkO8Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 7 Jun 2022 17:35:05 -0400
Message-ID: <CAHC9VhQ=tDdbTeugwiZtWkZxupDkdt7QBDr8a4txtSg0D+Q46w@mail.gmail.com>
Subject: Re: [PATCH 5/5] selinux: drop unnecessary NULL check
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Serge Hallyn <serge@hallyn.com>, Austin Kim <austin.kim@lge.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2022 at 5:26 PM Nick Desaulniers <ndesaulniers@google.com> w=
rote:
>
> On Tue, Jun 7, 2022 at 2:22 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Thu, Feb 17, 2022 at 9:22 AM Christian G=C3=B6ttsche
> > <cgzones@googlemail.com> wrote:
> > >
> > > Commit e3489f8974e1 ("selinux: kill selinux_sb_get_mnt_opts()")
> > > introduced a NULL check on the context after a successful call to
> > > security_sid_to_context().  This is on the one hand redundant after
> > > checking for success and on the other hand insufficient on an actual
> > > NULL pointer, since the context is passed to seq_escape() leading to =
a
> > > call of strlen() on it.
> > >
> > > Reported by Clang analyzer:
> > >
> > >     In file included from security/selinux/hooks.c:28:
> > >     In file included from ./include/linux/tracehook.h:50:
> > >     In file included from ./include/linux/memcontrol.h:13:
> > >     In file included from ./include/linux/cgroup.h:18:
> > >     ./include/linux/seq_file.h:136:25: warning: Null pointer passed a=
s 1st argument to string length function [unix.cstring.NullArg]
> > >             seq_escape_mem(m, src, strlen(src), flags, esc);
> > >                                    ^~~~~~~~~~~
> > >
> > > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > > ---
> > >  security/selinux/hooks.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > I was waiting for Nick to reply, but he never did, and this looks good
> > to me so I just merged it into selinux/next.  Thanks for your patience
> > Christian.
>
> LGTM; you can ping me on irc #ndesaulniers on most kernel channels if
> you're waiting on me. ;)

Thanks, but I generally don't have the spare cycles to keep track of
everyone's prefered method of interaction, that's why we've got the
mailing list (warts and all) :)

For what it's worth, I was waiting on you because you asked about the
additional trace info and without any context I thought you might be
looking for something else (?).  In the end, I think everyone agreed
that the patch was good so I merged it.  I think as a general rule
it's a good practice to follow-up with a reply when people provide
additional information that you've requested.  Not only is it the
polite thing to do, it helps clarify things with everyone else that
there is no hidden "gotcha!" in the patch.

Regardless, thanks for checking back on this :)

--=20
paul-moore.com
