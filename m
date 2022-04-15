Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C17B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:18:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b21so14932364lfb.5
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iS0+HG7ppU7CKCESRGpHVtK2c0Z1R6B4jgH5kiji7QQ=;
        b=F+sP503RIL9KnXQKFdw8jFLgM3dZlF/04PJ2kbfhxrIPN8Yhalc4DyWAUkxYtxEMrJ
         6bpDPGxbX5lWWQY+UrqYLwmhf4TOMq1HomOXo6Ise88EsvgtWPbA16ZQC5HToYsBVvWj
         xFKWWY4dyZoFOYnAM8yJ1ZJzApEuz8pBi7ayyQMZh5S5B7pvlsPanNXiYsiNEAsfqjIP
         T/hVCQxrw1DsiAOoppGY6NEe7Qb46C55TTHnI5LshCw1Da65ed//UKa4Y1AKT6SqAeoz
         SYTVrEua5tfScXJxSK9v/ctW6IVtJ3NMaVZGxyunlygcB1GB4POJvBW4pwdkfEFLruJp
         Vm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iS0+HG7ppU7CKCESRGpHVtK2c0Z1R6B4jgH5kiji7QQ=;
        b=4qFkDndbb8DFUcOzyNsWj5wDFNdBA957e0qtdzCQpps+TvkBQvQUU6aKYFvPpHMiex
         IAnDgC2dXdQzz1Qaxrd7/oHjvmr3dJ2H62sNocuL4TS6o07+UllmJpA1Pc+W2RGwxhkz
         9gt+Ow0VeHqkn7GLy/radhxgr+ilV7xPGMpMtU/Qom0L6mac9mtPL8y1nqbAdYeIulU6
         jMRxkVAkHZhd3LIEug2Bp8xV3cPHmNdWPSV//Zig1+k8iOau9XBV2W/eB3UYSEgC9QjQ
         DcSQg6NCLfifKoyx8CxW1w4mlOzUals5SJR2H6E6Rz6LcsGTxdaeqcSOf70pB3TvfQhy
         3kHw==
X-Gm-Message-State: AOAM531OVl2iEvrymCQCF8j61+OeGGOA2WPfvpISRAXMyKaTQbaVTx7U
	T3py0LmgOXk2WfoSrAERc5otrT2/GCswgm6oGy+38g==
X-Google-Smtp-Source: ABdhPJz5of4FOiZi7NmycxKw8mSHActvr8uPwHDxx+aTPMtO/jpqtfkfOuFpJ3bGjiebmm/zAydSQ6u1oJBop708IOQ=
X-Received: by 2002:ac2:5313:0:b0:46d:ef7:c2db with SMTP id
 c19-20020ac25313000000b0046d0ef7c2dbmr28258lfh.392.1650043078292; Fri, 15 Apr
 2022 10:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdniB-+F37ygZhRytBGVFjwnukyOpmoiJTCeusMdb=6_=g@mail.gmail.com>
 <3DE35A81-1FC6-4EC7-8F3A-B395B576644D@oracle.com>
In-Reply-To: <3DE35A81-1FC6-4EC7-8F3A-B395B576644D@oracle.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Apr 2022 10:17:46 -0700
Message-ID: <CAKwvOd=CqOfd=zprWQPYoddgnGPJMb_sdk2Eut9DZNJq_fFJ-w@mail.gmail.com>
Subject: Re: toolchain mitigations plumbers session
To: Qing Zhao <qing.zhao@oracle.com>
Cc: Kees Cook <keescook@chromium.org>, Bill Wendling <morbo@google.com>, 
	"Moreira, Joao" <joao.moreira@intel.com>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2022 at 7:50 AM Qing Zhao <qing.zhao@oracle.com> wrote:
>
> Hi, Nick,
>
> > On Apr 14, 2022, at 4:30 PM, Nick Desaulniers <ndesaulniers@google.com>=
 wrote:
> >
> > Hi Qing, Kees, and Bill,
> > Jose and I are currently in the planning process to put together a
> > Kernel+Toolchain microconference track at Linux Plumbers Conference
> > this year (Sept 12-14) in Dublin, Ireland.
> >
> > Would you all be interested in leading another session on
> > kernel+toolchain collaboration for mitigations? Do you plan to attend
> > plumbers this year which will be in person?
>
> I=E2=80=99d love to attend  plumbers this year to meet people in person!
> But not sure whether there will be enough new, big stuff to report this y=
ear since mostly bunch of bug fixes and minor
> Improvements to the previous work.

No worries; it doesn't need to be a presentation, or just one person
presenting.  I think a quick review of newly developed features from
various authors, then a discussion with consumers (kernel developers)
would be beneficial.
--=20
Thanks,
~Nick Desaulniers
