Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D9B7A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 18:55:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i5so12526817wrc.13
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qRnRhJJWad0NfkbuCANikaLEmHs3ldU2uccodI8L08g=;
        b=7lXdI+US3yWpFmLmeqGJRUGEETYf4g53DEHrLX2BuR5KAZrwo2kTtL3jehzVzDIG5p
         atM2mL6yCpjkk7fYctlOldK4pKPDNw2zQXmX8/TkSorKvdTk+frGA8eV3rQlMYVqgcPs
         8kfEd/L1CI69abdDvqIQy+tYo183kAiIAoG6QH/Q9bnwWdSHrbAwNrS3CqDYY8juXtEH
         YZZnkCArbT1weqK64wGyQOZufz2CwI33o0YBv5M/sM0MSGcenG1+PeK+AXRZSr9R7oHt
         Dh/2rVpFfPf9R0NUBhDEv5NDZFGJl4B8B50XtRvStKTiPYGN01d+rbF4yM5HDSUKk/Wl
         zvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qRnRhJJWad0NfkbuCANikaLEmHs3ldU2uccodI8L08g=;
        b=jSjLrlAn3YtBqNchQrUIF4eZiAcm6+cbmdBySMXk1M+746QlCley2xTFe9LVx6y6Wg
         AFOXejILpthM+u5r5NpRZdbxmAyIsNjySMibTCjtKtJX7mYkJNz3gRAZ974NRY0UU2mr
         /zxEX2B7uJFKR/7+nc5C046bkcP7uye0Rqo5yJPNNBklogKPouUPb4sfPR1HkhtiYSOX
         pM0PenzMnu6EDHEpd/8DOksXNOU8/EctvHOSqh2NiKpCnZJt6cAzz62M0NjsaDaOtePe
         CIUKQpvQPSFnm9CFs5AE3iIkYvZ8ILKAa6EAQpZWFMKgUuWvo3/KXg4F8MtFMAF7hCJX
         NCuA==
X-Gm-Message-State: AOAM531tSz852ushsjW09XiKwVdjepB+9ly4X+6ocdEALytNaWEInm/H
	qYtYeNU6NBHYib7IOM0Cq1ZpBW7HFb6fEoJrgOwC
X-Google-Smtp-Source: ABdhPJxpRZpcOpSm4GKLTC1g+8cigIL7wsm6aXqnnakJx39XpYfkGY+a50E1FwTxoLfQGqG3u4IET/RWUwWFW6f/g04=
X-Received: by 2002:a05:6000:10cc:b0:20a:de6f:3c48 with SMTP id
 b12-20020a05600010cc00b0020ade6f3c48mr4974596wrx.650.1652468116804; Fri, 13
 May 2022 11:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217141858.71281-1-cgzones@googlemail.com>
 <41224e84-2da7-3f69-0fdb-bb309ad6a3d4@schaufler-ca.com> <CAJ2a_Dfqm92Am5PFPh+3itWZmArWRuVadcRO+=i-BPhQ8QmA8Q@mail.gmail.com>
 <CAHC9VhR-Xk65iSfZxVvaK+mJoFszxT2E8vF=cus1aAKcB0EgYg@mail.gmail.com> <CAJ2a_Ddy8Kkp6SHxktguSQ4WqHwpA=zrQUz8UYkajF5-YtPerw@mail.gmail.com>
In-Reply-To: <CAJ2a_Ddy8Kkp6SHxktguSQ4WqHwpA=zrQUz8UYkajF5-YtPerw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 13 May 2022 14:55:06 -0400
Message-ID: <CAHC9VhRqh1oB_9Bhh37fbS=fszzjk8B=T2fHkjnrVUjp=pnvpw@mail.gmail.com>
Subject: Re: [PATCH] security: declare member holding string literal const
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>, SElinux list <selinux@vger.kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Xin Long <lucien.xin@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>, 
	Todd Kjos <tkjos@google.com>, Olga Kornievskaia <kolga@netapp.com>, 
	Linux kernel mailing list <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 1:16 PM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
> On Tue, 3 May 2022 at 22:02, Paul Moore <paul@paul-moore.com> wrote:
> > On Mon, May 2, 2022 at 9:38 AM Christian G=C3=B6ttsche
> > <cgzones@googlemail.com> wrote:
> > > On Thu, 17 Feb 2022 at 23:50, Casey Schaufler <casey@schaufler-ca.com=
> wrote:
> > > > On 2/17/2022 6:18 AM, Christian G=C3=B6ttsche wrote:
> > > > > The struct security_hook_list member lsm is assigned in
> > > > > security_add_hooks() with string literals passed from the individ=
ual
> > > > > security modules.  Declare the function parameter and the struct =
member
> > > > > const to signal their immutability.
> > > > >
> > > > > Reported by Clang [-Wwrite-strings]:
> > > > >
> > > > >      security/selinux/hooks.c:7388:63: error: passing 'const char=
 [8]' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompat=
ible-pointer-types-discards-qualifiers]
> > > > >              security_add_hooks(selinux_hooks, ARRAY_SIZE(selinux=
_hooks), selinux);
> > > > >                                                                  =
         ^~~~~~~~~
> > > > >      ./include/linux/lsm_hooks.h:1629:11: note: passing argument =
to parameter 'lsm' here
> > > > >                                      char *lsm);
> > > > >                                            ^
> > > > >
> > > > > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > > >
> > > > Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> > > >
> > >
> > > Kindly ping;
> > > any progress on this one?
> >
> > I've already added my Reviewed-by tag, as has Casey, so I think it's
> > pretty "safe" at this point.  The next step is for James to pull this
> > into the LSM tree.  If it is still collecting dust at the end of this
> > week, ping us again and I can just go ahead and pull it into the
> > SELinux tree, it's small enough that it shouldn't cause any problems.
>
> end-of-the-week-ping

Thanks for the reminder.  I haven't seen any other action on this so
I've gone ahead and merged this into selinux/next; thanks for your
patience and persistence on this Christian!

--=20
paul-moore.com
