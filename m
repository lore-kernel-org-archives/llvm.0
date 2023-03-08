Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5528B36D
	for <llvm@lists.linux.dev>; Wed,  8 Mar 2023 23:26:03 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ay14so66661edb.11
        for <llvm@lists.linux.dev>; Wed, 08 Mar 2023 15:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678317961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApZcN/clhztxkBCrrdq75AIej//C1Akoazz2oc+iFsg=;
        b=fgjq3xXE9HG9mlBpJPFd9XxqrDveCW8dgajiiGraZ3DJoBgiXA4fmLxWN6bMMIZRxV
         bPAREZhjldhxyjGSyhxJem7uKihUvXUdTEc98CexykU/jd+ziZbAYI2vQrs1Tnx97cNr
         qEKS8mOCng9nSi9wgwiC0TYsUUbFqsIY/CQ30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678317961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApZcN/clhztxkBCrrdq75AIej//C1Akoazz2oc+iFsg=;
        b=nuKAPb2s0N8uMEIoR2KDKPS4jTOscxoVhsIKCGn0fYgjmsVEPqPCYTW/Ns7npcvOR0
         4JA//k1hgLa7eZHy5N+9KDQpKjDHESWlSe0gzHPu4orN9bEL9HJbsgCl1j0NELoKg8S6
         JMOnwDuXABFwx9fysYTNanzr+oUzS45KG6FXRLuWIRCWEENjafeHrvoBbChcl7TDaTCP
         gfsEvC0a4t+ljy/KwhcptyFLP54TC3i6FaTXC/JPt3JSur0qXu5jGCsenFu0NMVzbRZa
         /0CMcgjb27DIHoNgZSfykc139aua/raRMw51L2R8RIWvh5QYqnratbZeOx3n3XwEUJuZ
         ZTTw==
X-Gm-Message-State: AO0yUKV6kpBJD5+rQvX8Ckoy8VhIXSVgRkT2q9fq3m9k3Q2u2z7gmFWr
	aMOJl/WKgEw3LI4J1zHdvuiqK4q+hUIHSX/1c+/zrkBA
X-Google-Smtp-Source: AK7set+AkbAujwGRb3SY64YKQDPfJIlsWSRvCFMvk0IkO7Xfoc6G3h5EA3QuHtrdmfxjzafBQjAE/w==
X-Received: by 2002:a17:907:8686:b0:8f7:5038:9896 with SMTP id qa6-20020a170907868600b008f750389896mr24553434ejc.70.1678317960997;
        Wed, 08 Mar 2023 15:26:00 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id o13-20020a1709062e8d00b008e22978b98bsm8108934eji.61.2023.03.08.15.25.59
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 15:26:00 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id x3so82511edb.10
        for <llvm@lists.linux.dev>; Wed, 08 Mar 2023 15:25:59 -0800 (PST)
X-Received: by 2002:a17:906:398a:b0:877:747e:f076 with SMTP id
 h10-20020a170906398a00b00877747ef076mr9357904eje.0.1678317959537; Wed, 08 Mar
 2023 15:25:59 -0800 (PST)
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
 <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com>
 <CAHk-=whCA4-uc5WV_-68Mpmu-TiSv6fxkSjZ19zzcW9jpSxDvA@mail.gmail.com> <CABPqkBR_U06L8skMsDXxSXfMptezequzRCxOTELAXxGDK+F+DA@mail.gmail.com>
In-Reply-To: <CABPqkBR_U06L8skMsDXxSXfMptezequzRCxOTELAXxGDK+F+DA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 Mar 2023 15:25:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjqRUVq_U8D+ZrP_2sUzJ2bq5oGdD_7xi=mQnEY3b=O2Q@mail.gmail.com>
Message-ID: <CAHk-=wjqRUVq_U8D+ZrP_2sUzJ2bq5oGdD_7xi=mQnEY3b=O2Q@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Stephane Eranian <eranian@google.com>
Cc: Jakub Jelinek <jakub@redhat.com>, Segher Boessenkool <segher@kernel.crashing.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, tony.luck@intel.com, reinette.chatre@intel.com, 
	fenghua.yu@intel.com, peternewman@google.com, james.morse@arm.com, 
	babu.moger@amd.com, ananth.narayan@amd.com, vschneid@redhat.com, 
	Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 10:13=E2=80=AFPM Stephane Eranian <eranian@google.co=
m> wrote:
>
> Tested-by: Stephane Eranian <eranian@google.com>

It's out as commit 7fef09970252 ("x86/resctl: fix scheduler confusion
with 'current'") if anybody cares.

           Linus
