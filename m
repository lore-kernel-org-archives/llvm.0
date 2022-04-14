Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F083225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 21:53:24 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id i184so5441059pgc.2
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qUWTQrpnr3ofnuYRMoFQ70S/yjLY9Y8vBL8YKw/kQsc=;
        b=fQxaYeYJvYd7b2pp/KGWG5Vx8kcXY4LVh+NHg1G0nqUarkxFClfm73NukH/Pi+jLnx
         J34SXFTJmFSdj7lvBX24p2Fz+TchLrv1hZ/N1cApaiuXVyb5Ago1+udKizVITQ7KFl38
         FicwfMPfGHFvkwu9E8061ROu5W5Jq4RTQ873cNT+SKhF7IFVP+VU09EYEGcHNZzErh6w
         CabYRJBFghGa1uNjjGGcsAFXiOVcfVQ4Zjo+1LAJ7waOf1obtnjnyBSONLfo+zjS7PhL
         LT2ChuPxNbpw9mEa0pVxwaIXxU26d3/EWg7v2r7XbwmH51dgSfPstDU0hIOuIIYTReDl
         qcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qUWTQrpnr3ofnuYRMoFQ70S/yjLY9Y8vBL8YKw/kQsc=;
        b=tLIFJrnvLu/9nXjS7F0ofCl+9YoQ78JMbZedlAJsoJicMK6gDhWm18LfAfB9Tl0CLG
         oCYb3TMr8978GhugVXKobIWTh+ZGGAUVAaI4aqRxT71bUY6u53niLnY2fHeu/QsydDOF
         W8+m5HWZDteBLRkUg8jGjASn7+Qf6vqvCKm517evXg9+m9VF60LktNojmhYfUK/oYXdV
         Q5r08o+GZI1vVk32VDXJ5C06I+EabQzy6Yg4NzUwUg1IoiinryX3Krd4OEBVnj9Ju+Sj
         IzL1ATc53MgDuuxOVEmrJklPWM4CUABpAFZwewQ4N+hTfKe2zn69a+Oz52kxwGrPrlGE
         wnwg==
X-Gm-Message-State: AOAM531DRKFf0fRr7aFkXAyH1geG22sK7BWmq5uUcDLDuPFdmqJTsJkj
	9GeOcVOUdDyPULhKuN2jnUcsR68tHGniJtG2VrdL
X-Google-Smtp-Source: ABdhPJx9ymsemc0+5i916kEfjLB7rgHgcyATd9Hcd0pBUKaMwBl+oWiTuphe0h+MoenK9bSrca1ddvBWbjtfIsBblCw=
X-Received: by 2002:a63:6bc6:0:b0:39d:966d:2791 with SMTP id
 g189-20020a636bc6000000b0039d966d2791mr3875379pgc.407.1649973203853; Thu, 14
 Apr 2022 14:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdniB-+F37ygZhRytBGVFjwnukyOpmoiJTCeusMdb=6_=g@mail.gmail.com>
In-Reply-To: <CAKwvOdniB-+F37ygZhRytBGVFjwnukyOpmoiJTCeusMdb=6_=g@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 14 Apr 2022 14:53:12 -0700
Message-ID: <CAGG=3QUF8am44D-jy_pSTirV4-Kfr5QTavRc8tntytxt2iqj1Q@mail.gmail.com>
Subject: Re: toolchain mitigations plumbers session
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Qing Zhao <qing.zhao@oracle.com>, Kees Cook <keescook@chromium.org>, 
	"Moreira, Joao" <joao.moreira@intel.com>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 2:30 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hi Qing, Kees, and Bill,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.
>
> Would you all be interested in leading another session on
> kernel+toolchain collaboration for mitigations? Do you plan to attend
> plumbers this year which will be in person?

I'll be in Dublin during that time, so yes to both questions.

-bw
