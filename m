Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2A1C5D66
	for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737667498; cv=none; b=FQy9C1ekSDysrPjwbeH3ISOPbRDjLrKUhDacgVdv4Cui0/6bEroOhCTdgHBuMB9RRPGrw/ZhSLT2hG9HkovVy9UCWdXapTcmPT8QbqRzcZbG4kvc3qJS6U/JoWgenjzTgr98X50T7Vco/Cnzrba08hB/3Gb6nLR+mBZDzUtplHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737667498; c=relaxed/simple;
	bh=M5BXGpgwMCnIFqEQNLncr323vXpk/UyBJI1PvRa54rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIAMa/M9sxkbT4wa2aiKudfll1ajv8oEYzHZvIgQZMiFJSovKzd+I08y8uzQ8HPl7JYGD+i2V91M+ZzOIreJI0vzdwiN8sb/0VG6tm2zK/wFLvhG2z2aU2WKW3uuvE8CRo5T7yAx8iTzMjY0cRXED241PQqPKnABJ1lONJrHtCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hB1jv/EQ; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hB1jv/EQ"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a814c54742so7705ab.1
        for <llvm@lists.linux.dev>; Thu, 23 Jan 2025 13:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737667496; x=1738272296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5BXGpgwMCnIFqEQNLncr323vXpk/UyBJI1PvRa54rE=;
        b=hB1jv/EQ7H67+d4OGGOZyGoWQWAwEdnQkRLd34FRmGnLaVZbHyhJ54WjqpTDIigvyi
         6H72mhQAuFDFdjcHt+ZutU3/ahIoG+QptPxJ28lILFAzOaHuUuN0C+rqs6N3Y07mxlL0
         JlMjdK/uaA1XcLU5hK50XiKVx99QTXJHt9EXZoAe7brpOE+d69Dcnv5WrEyXLy/DijlW
         lwaHINj5AS5C0/pZ0LA4KSPmlRvOvcozU0y9BbIKf8uoaQAK7swSo0DESMFM5LZKv+jZ
         ipvolyNHRxzTu1VOdW8qHEVunyAmhkNvJsu9okm9F5BDuuORtchbB9duFnlOlbC1SPu7
         CQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737667496; x=1738272296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5BXGpgwMCnIFqEQNLncr323vXpk/UyBJI1PvRa54rE=;
        b=QOBrFjUjmiWaNmnPPrtLTEXMJSZyRglcLudVuU2lM03QnPtD1twA0yykSpQ2w4hdZp
         bSr2HXT8yz1vyYF7nuIG6Br/CjIXq/u0Vk/3tymbROj46lfxzGCNfKbrYh50VwYS4lI6
         y0NJjYZkyDVBTyKc9v2PY91XMt3sNiSu0fPFzZiTGLN+FYdG0Wd6CXgdZ1YW1Id8gNs/
         WIZIAnLrVgjJNv06zqgUOcqhbwKTozRpy1SESEVLyHFa4Hd+u5xZuuDhwrK81WUx77Uk
         8L7U9hDdkGhChopGAkjQl9B56W47w/J0+HOZenUX4HdfRIbOi3IJDdcYM0dItTQ2gd53
         Y9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXu7ipflz1/wj+rbxj4iTMXoRZCbIKDWn52qPK32m/8ntt1CFPfrmg53yTPPTM9GPzJwRiR@lists.linux.dev
X-Gm-Message-State: AOJu0YwQVjnMWIS0vxTZuZJQ2dZ48mX0UkRrV/yr5bBbaPoBYHJnHncz
	kkol2/7lV0qVCS3lWm3BsDwe/4eDtTyG0xatxlBJTZlVMnwSUsf/gfB008gS4yiL7Vv2apSizrr
	VRko67TVvLYqUtuzLHh/1Q9kLfDnav8hPOhjz
X-Gm-Gg: ASbGncsXhYjp7DnxK0U+ej1QeVt9df2P/D5bpojfdfdzyTp6m4r9Ta6y7s7LWlDFitV
	MwdtiMhi7ngkRJJtMFp891IHBdbaVmn7gH77nNcRvlPDYCszRoRlXcBrIoRQZAmgpxcth0PuMnw
	c6MpAgXjtbqda8+Q==
X-Google-Smtp-Source: AGHT+IGwvofrtUyEuSwOuV3OUTAsv9p7IO9zxK0RoTXVD1YmkrPrc9vYfh/5phhlnpuNXd8qGJMfJHgAwe0IUpnUZuM=
X-Received: by 2002:a92:da09:0:b0:3cf:c1af:99f with SMTP id
 e9e14a558f8ab-3cfc1af0b2bmr2536455ab.24.1737667495808; Thu, 23 Jan 2025
 13:24:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com> <Z5EM24qWVQF2VdI8@tassilo>
 <CAP-5=fW6ZWf6jF3Xnike81S9s_5tZ9w4DS8=8Ff1Ve87O32_Sg@mail.gmail.com> <Z5KILXC9-dN4Vo1o@tassilo>
In-Reply-To: <Z5KILXC9-dN4Vo1o@tassilo>
From: Ian Rogers <irogers@google.com>
Date: Thu, 23 Jan 2025 13:24:44 -0800
X-Gm-Features: AWEUYZm6s3k1Q3-4dxuPxZe5_z1NgGEQjOMpv31v0pNOZT3BbLBoJ2mkb87R2IA
Message-ID: <CAP-5=fW5xmir_26CrQN50TWkzab3GueUvne4VWhWhqc82p6LvA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Support dynamic opening of capstone/llvm remove BUILD_NONDISTRO
To: Andi Kleen <ak@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Changbin Du <changbin.du@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 10:19=E2=80=AFAM Andi Kleen <ak@linux.intel.com> wr=
ote:
>
> > In certain scenarios, like data centers, it can be useful to
> > statically link all your dependencies to avoid dll hell.
>
> Yes but it won't be loaded into memory if not used. Executable
> loading is all lazy. Maybe look a page fault trace for loading
> perf if you don't believe me.
>
> So you're trying to optimize disk space here?
>
> I didn't see that in the cover letter.

For me yes, for distributions it is dependencies. This is already in
the v3 message:
https://lore.kernel.org/lkml/20250122174308.350350-1-irogers@google.com/

> It doesn't seem like a very good reason for such an intrusive patch kit.

The capstone and LLVM code is preexisting. Moving the capstone/llvm
code to their own files isn't dependent on dlopen, it does make it
nicer to have a single place we're doing dlopen. The change to shim
the capstone/LLVM calls looks like this:
https://github.com/googleprodkernel/linux-perf/blob/google_tools_master/too=
ls/perf/util/llvm.c#L160-L182
That is a shim is introduced that either calls through to the function
if we're linking against libcapstone/llvm or does the dlsym. There are
7 such functions in the LLVM code. I don't think shimming 7 functions
is at the scale of hugely intrusive.

> If it's a serious concern maybe investigate an executable compressor?

Perhaps just have a squashfs partition.

Fwiw, excluding dependencies I think compression on the events is a
good solution. Convert json events/metrics to a sysfs file with the
cpuid in the path, add the compressed file to the binary as data, find
"json" events by iterating the directories in the compressed file,
etc. A single filesystem approach to event lookup can mean we do some
kind of unionfs style lookup of events, which could support users
adding their own events/metrics in a directory. Zip doesn't support
compressing across files, which is something of a requirement here,
other formats do but it's a case of optimizing for some kind of
libarchive sweet spot. The opportunity here is that about 70% of the
binary is event encodings, a compressed file is about 30% of the
current binary size, so we could reduce the binary size by about 40%.

> > The X86
> > disassembler alone in libllvm is of a size comparable to the perf tool
>
> I agree that LLVM is a serious bloat and DLL hell concern, but I don't th=
ink
> dlopen is the answer here.

Agreed, but it's where the code is at. addr2line command or use LLVM
for some performance. I think having an inbuilt solution would be best
longer term - we spend energy trying to parse and understand text
output from tools/libraries when the information is just sitting there
in the instruction encoding. Such a solution would be brittle for
things like new dwarf information, so we may want to have fallbacks
like LLVM but having a loosely coupled dependency using dlopen feels
preferable there, to aid package maintainers.

Thanks,
Ian
