Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2F10792
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 21:20:35 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id d36so15692741lfv.8
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678224033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htYShvi2AdwpLoEtnEoYaPRYtP4Z0z3zxKkxUWERHwg=;
        b=Nwchns5kNKVXdUTvqvygOjk/e85iInkOAgzoGOP0bWZzmWHSo1tIJOi3nCRbZVS6kh
         +HYOUY/vFZBFMRhSLKXjIiDVzx2j212Ga80cAeXk5/SnGpdKrNkVRjHUrn00cBSHWQC4
         HjRKS/lxRvA7SsN9xCoZ8uPzhPa0tgc9Vxy7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678224033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htYShvi2AdwpLoEtnEoYaPRYtP4Z0z3zxKkxUWERHwg=;
        b=lvOq60dv31/dq9pU5ifrkt1zIsOnNzSHljPN7mu3PF/CgXkMU0ClxLXcsDqBEqLa7J
         RFrLxfYchBpAZYqNiNOdJq3g9cSK3kkocVzTXDbH8UNmj0eqtZI5hj5y5iEoFx4RXWhb
         A4Pd7FKyd6HyRW7uMP+ahtMHO9b/kgqeQ7zaQHVpSRjYjriExoiwwjgrYJkRW9ym2NIH
         RmGzmPsmEQg8enPUPqDNHOYy1i/ykASaPLJTGG5p6yqJlb9PwnW+okGmwPgWqGHt0McZ
         f6rNnhh9l18O+jVdTTmcZ875e6H7xaagCuq6XDbJEGGcF0JXNzOvXqAMWfqj/bWoWGTj
         K9HQ==
X-Gm-Message-State: AO0yUKXOLn9oFe7dPFuGefRC6prRcsDJqU21h0oN2m1xMzI1pZcpgi9X
	muiDwlQvvcUr+HaoZftadine8P5Q8CqCFgOJLf+XUjjg
X-Google-Smtp-Source: AK7set/Od+6LmJYNCDu3sGMbUGBf61ypWDGyA2qVSoQWU6gDeTIhNh1A3ksyYcTUpaL1X0wTYy3XRA==
X-Received: by 2002:a05:6512:11cf:b0:4cc:6e3a:32a3 with SMTP id h15-20020a05651211cf00b004cc6e3a32a3mr4635207lfr.25.1678224033439;
        Tue, 07 Mar 2023 13:20:33 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id b16-20020ac24110000000b004d862e9b453sm2139880lfi.196.2023.03.07.13.20.33
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 13:20:33 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id h3so14566326lja.12
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:20:33 -0800 (PST)
X-Received: by 2002:a17:906:a01a:b0:8f5:2e0e:6dc5 with SMTP id
 p26-20020a170906a01a00b008f52e0e6dc5mr8126466ejy.0.1678223686605; Tue, 07 Mar
 2023 13:14:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303231133.1486085-1-eranian@google.com> <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
 <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>
 <20230307113545.GB2017917@hirez.programming.kicks-ass.net>
 <20230307184315.GS25951@gate.crashing.org> <ZAeh8g0nr3IFRSVI@tucnak>
 <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com> <SJ1PR11MB6083CADB2B6E859915D456F7FCB79@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083CADB2B6E859915D456F7FCB79@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Mar 2023 13:14:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whzzd53rW5Uk0oK7bXVXS_X6sJiisnhrqaz+MkutO7qug@mail.gmail.com>
Message-ID: <CAHk-=whzzd53rW5Uk0oK7bXVXS_X6sJiisnhrqaz+MkutO7qug@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Jakub Jelinek <jakub@redhat.com>, Segher Boessenkool <segher@kernel.crashing.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Eranian, Stephane" <eranian@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Yu, Fenghua" <fenghua.yu@intel.com>, 
	"peternewman@google.com" <peternewman@google.com>, "james.morse@arm.com" <james.morse@arm.com>, 
	"babu.moger@amd.com" <babu.moger@amd.com>, "ananth.narayan@amd.com" <ananth.narayan@amd.com>, 
	"vschneid@redhat.com" <vschneid@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 1:11=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wro=
te:
>
> Can you expand about part "a" ... Linux has zillions of static inline fun=
ctions
> in header files to handle CONFIG options. One version is the real McCoy
> while the other is just a stub for the CONFIG=3Dn case.
>
> What's different about this one?

See the patch I just sent out.

Linux has a lot of "static inline" functions. But that's not at all
what that function was. It was literally just

  static void __resctrl_sched_in(..)

which is disgusting and very wrong.

I hope that compilers then just ignored it ("It's static and not used,
so I'm not generating that code"), and that header file isn't included
in very many places, but it's still very wrong.

               Linus
