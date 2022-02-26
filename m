Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F2369B
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 05:04:16 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id y5so6478745pfe.4
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 21:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=E873fV4pQ7eoesQTVG0pcEDlvHYqEcX/Ujnaje4n6Sc=;
        b=PuNlEqmTgPvbVko2IReAQCR8Mr+X9hEMLYKWGjCC0QrDMXopv4fjrjc5WPTJ1TelI5
         CX32T4CBThdDDf4nK51URXF7g0gEiXfPGw5XuDcgxeYbfWyKCdbzJdmqiv8thAwnrSVJ
         nKVc11gI72oQ7nbLe9qIFneRzbBaxyAdSq/+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=E873fV4pQ7eoesQTVG0pcEDlvHYqEcX/Ujnaje4n6Sc=;
        b=k0Y2KMtDJJohB+pcMPSz4hcF5gDRwYbGpF2CjDY/8d63/0KvonZlij2vw3giep0QVM
         yWjDe322QB6gFHhCCGFY3Ji18jrk2y/1E8/5JjkMNo0Cmrlhf0dY632STD5I101SNuN3
         9mad0+0bHaizPBsb2d2YPXtL7tE+XUxx11mvGkESfuHGUZicr3iCAcMoxeldciQFNZOc
         P7U6fzEWfn/Oc3intAzPlLvjHUotb2Zk/CK08kHm8IYb+nn41e0Vm7qHDL3rAep8fcjl
         ENB1e/eQlil14LCV1Ga/P+iBDs2G60HUCzMwh0YUVqXz0lwsl5caUzbct5SZinlP6s35
         QzQA==
X-Gm-Message-State: AOAM53204lZgkLdiZunzKYwSr/3/PyuWkIjcTnL6unwWx7eEU5Pp2hpE
	HrOvrlTr5s4P+NdJyIkGI8IzLwYTJopRFA==
X-Google-Smtp-Source: ABdhPJwNToOBqTnqAPGsKmAI9k63BhDZ7x7s2H8BYnul7vzHErq3PCxizFnKnvtBns8K+4T0tIyBxA==
X-Received: by 2002:a63:4560:0:b0:370:1f21:36b8 with SMTP id u32-20020a634560000000b003701f2136b8mr8813537pgk.181.1645851856083;
        Fri, 25 Feb 2022 21:04:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z14-20020aa7888e000000b004e5c2c0b9dcsm5212196pfe.30.2022.02.25.21.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 21:04:15 -0800 (PST)
Date: Fri, 25 Feb 2022 21:04:14 -0800
From: Kees Cook <keescook@chromium.org>
To: =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Cc: Joao Moreira <joao@overdrivepizza.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	hjl.tools@gmail.com, jpoimboe@redhat.com, andrew.cooper3@citrix.com,
	linux-kernel@vger.kernel.org, ndesaulniers@google.com,
	samitolvanen@google.com, Mark.Rutland@arm.com,
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org,
	mhiramat@kernel.org, alexei.starovoitov@gmail.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 05/39] x86: Base IBT bits
Message-ID: <202202252103.966D14E1@keescook>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.307406918@infradead.org>
 <202202241627.EEF3D5D2@keescook>
 <YhgnA8O4Bp19hfse@dev-arch.archlinux-ax161>
 <YhlTRhh7qj538ygM@dev-arch.archlinux-ax161>
 <605731324a76f36aafa87bd9390808c3@overdrivepizza.com>
 <202202252055.AB16A4B8@keescook>
 <CAFP8O3LDdGKQ0HzhfmsuDRfCEWC3sAAizUTjU_UKERzseX+H3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3LDdGKQ0HzhfmsuDRfCEWC3sAAizUTjU_UKERzseX+H3w@mail.gmail.com>

On Fri, Feb 25, 2022 at 08:59:57PM -0800, Fāng-ruì Sòng wrote:
> On Fri, Feb 25, 2022 at 8:58 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, Feb 25, 2022 at 04:29:49PM -0800, Joao Moreira wrote:
> > > > https://github.com/ClangBuiltLinux/linux/issues/1606
> > >
> > > Candidate fix: https://reviews.llvm.org/D120600
> >
> > And landed! Thanks!
> >
> > Since this is a pretty small change, do you think it could be backported
> > to the clang-14 branch?
> >
> > --
> > Kees Cook
> 
> I have pushed it to release/14.x :)
> https://github.com/llvm/llvm-project/commit/f8ca5fabdb54fdf64b3dffb38ebf7d0220f415a2
> 
> The current release schedule is
> https://discourse.llvm.org/t/llvm-14-0-0-release-schedule/5846

Great! :)

-- 
Kees Cook
