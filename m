Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7931EA9
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 01:37:26 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4MdG2l5Xrnz9vJbq
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 01:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
	by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ON83GR1BJrfu for <llvm@lists.linux.dev>;
	Wed, 28 Sep 2022 20:28:15 -0500 (CDT)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4MdG2l3F9rz9vJbs
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 20:28:15 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4MdG2l3F9rz9vJbs
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4MdG2l3F9rz9vJbs
Received: by mail-pj1-f71.google.com with SMTP id pc10-20020a17090b3b8a00b00202be8d81d2so2604744pjb.1
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 18:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=r2sN88rES+GCiij16Y6H9XHSivZGMue4f1jc1ky8Ql0=;
        b=S++o4oz4c/L6xd1QrKh+G1zz1rLXqXCY4Uh/y8kaeoeiOholc/cSfPq0vqNO8tOsAt
         By09HeYOaWLW+0lFkXk+8+i/qlVpQKDdvdo4s5J3Eo90QqdeoOqQxfhcJJus8PVf/b1W
         t5NEFbhenLCW2KBClz+wc0OPxn4vHuKuZfUdePpfnh0IgOZ9Q8z1kKouxoNo9FMb9GIz
         pLqCsixyriepEtH6OwUjwThSRA1cEJT87Y1TH5HnJXoCdRCQpqrRSz87A9lq8xG+3JPo
         9rMfM0fLJtF31pYO46c9UnCYz9LD+tcUto2tPBV+gEhvhL+uWdB+QMvqAkisDenpXNeG
         IdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=r2sN88rES+GCiij16Y6H9XHSivZGMue4f1jc1ky8Ql0=;
        b=WuYKIPaADQwfuxZJlSaxOFYzwPTAlVtSdwKuSFdGg1PEKKvJ30TBgJeGYFQL5XT0gh
         Cre1MtJenAKq7SeDjL8PNjfkAtSVB1UKl/U5/JSJT18y8vL5jyy/O6DPojM/AXwvl0kD
         ywIyRnIakN2MGloyWsouDfP8Jfruc/8sSnujkBtBmfHlxpTom77frVQCCCH/EVp42Fwd
         CtAvnelXwBHaoUSNAFh22eX4nEeEUkzE2CDrPGQu9830pbRAmbWA4tsrSvrRyYBDg0Ay
         9NHKWP0IKbO0+Q3I0ZAvFb///s2h9YLctPsA13+AqFaqv/tOnDv3lCApUJ+f9g2IkXSR
         WNSw==
X-Gm-Message-State: ACrzQf2RSXsdSjeIncZTHCErA97lM7OM3k/pudiRkPvmq6LQ0Gibk7sv
	/IEbLk1gJxL+h39wsAw6RxH7CdrY6IK0AJxZ9nePruQ7dWr/EIwukTeOnMsead2AJK5pYIgcZax
	v5w9TOBuRlWUASE9cni9JepU7VBu/aEERJQ==
X-Received: by 2002:a05:6a00:14c4:b0:542:cd3a:591e with SMTP id w4-20020a056a0014c400b00542cd3a591emr772785pfu.27.1664414894436;
        Wed, 28 Sep 2022 18:28:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TbmuEiE7cSesx/sittSjJusa70P4btPEL7zmj+gB3zmQI0mIm/OSrLd1PIYcWITVRpW4vJ18hGClrQzJ+uZY=
X-Received: by 2002:a05:6a00:14c4:b0:542:cd3a:591e with SMTP id
 w4-20020a056a0014c400b00542cd3a591emr772760pfu.27.1664414894092; Wed, 28 Sep
 2022 18:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGXevkhSrz5B=NavzTH1WLLGjmJ=z2AVXb-vm1ZRvJO=vK8x+w@mail.gmail.com>
 <CAKwvOdmb3dpYM5tOasgKHB3h1CQuV0GTpjM6Z2NL-kgrhGuvwg@mail.gmail.com>
In-Reply-To: <CAKwvOdmb3dpYM5tOasgKHB3h1CQuV0GTpjM6Z2NL-kgrhGuvwg@mail.gmail.com>
From: Kangjie Lu <kjlu@umn.edu>
Date: Wed, 28 Sep 2022 20:28:02 -0500
Message-ID: <CAK8KejrVM=ArJ1yobfT7kQL1=RnX8uuWm8orCKEyqUr9FuDh+g@mail.gmail.com>
Subject: Re: Connecting Nick and Kangjie
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Navid Emamdoost <navidem@google.com>, Nathan Huckleberry <nhuck@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Kees Cook <keescook@chromium.org>, Mats Heimdahl <heimdahl@umn.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Navid and Nick,

Glad to hear from you!

On Wed, Sep 28, 2022 at 5:50 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 28, 2022 at 3:37 PM Navid Emamdoost <navidem@google.com> wrot=
e:
> >
> > Hi Kangjie,
> >
> > I hope you are doing well. I wanted to introduce you to Nick who is wor=
king on very interesting projects at Google for the Clang-built kernels. He=
 came across your CCS paper on identifying indirect calls targets, and was =
interested to know about more of your work.
> >
> > Nick,
> > Kangjie was on my PhD committee and we published a couple papers on det=
ecting resource release bugs in the Linux kernel. Hope you can find interes=
ting topics to collaborate on. Please feel free to keep me in the loop.
>
> Naveed, many thanks for the introduction.
>
> Professor,
> My colleague, Nathan, recently pointed me to
> https://github.com/umnsec/mlta which I was unfamiliar with.  I've been
> driving the effort to get the kernel buildable with clang for the past
> ~6 years, to help facilitate such academic research as this.  `asm
> goto` support landed in clang-9, and has been a major focus of my work
> in LLVM in particular.  Seeing the difficulties with them mentioned in
> section 5.1 of https://www-users.cse.umn.edu/~kjlu/papers/mlta.pdf
> gave me a chuckle (a sad one...it's been a long painful journey).

After the MLTA work, I was amazed to find that Linux was fully
compilable with Clang. Now I realized someone is striving to make this
happen :)  Thanks!

>
> I was wondering if you would be able to stop by a public virtual
> meeting we host once every 2 weeks and give a quick (~15 minute)
> presentation on MLTA?
> https://clangbuiltlinux.github.io/ has the Google Meet and Calendar
> links. The next instance would be Wednesday next week at noon Pacific.

I'd love to. The best time for me is the one following next week
(10/19). Anytime before noon or after 2pm PST should work for me.

>
> In particular, I'm also curious if you have additional research
> underway involving the combination of LLVM and the Linux kernel?

We do have ongoing research that is involving both LLVM and Linux, but
it is purely for analysis and code hardening, not for bug finding. For
example, we recently finished another follow-up work of MLTA and are
able to further remove 40% of indirect-call targets in the Linux
kernel.


Best regards,
Kangjie



> --
> Thanks,
> ~Nick Desaulniers



--=20
Kangjie Lu
Assistant Professor
Department of Computer Science and Engineering
University of Minnesota
https://www-users.cs.umn.edu/~kjlu
