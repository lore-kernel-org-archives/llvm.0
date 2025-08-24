Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B51DE3BB
	for <llvm@lists.linux.dev>; Sun, 24 Aug 2025 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756053587; cv=none; b=eTBempkx99c7xyZWa43yKZhF2ak2upBJOYtCoGvpaeQbGlk+q1qNBkV42xXftrEi86aIdpulNZJk+qSmLUwywFAznM5oFIPefgRWZ+MQP6SftjES18qI8P6LmNNclgWt7oPEAqgA23JEDDblg8ZQCg2ylCf+I/BwCtbxMUcHHyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756053587; c=relaxed/simple;
	bh=rzbrFRokTuoA/BGlN6chg/kU+YDV0lrR5n5SZHBY0yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHtih9hrSzCmmTFvRKY3RdrgsrgOJQ90mZLhFM16HGbCNuGlCKO3DrE7hqOVH3JD9BWoH3+YYlvx8m75opG+djdkbQPj1CZujfFkmak4xmgHaNYWzbUUVqnialL5kFqM7jEheoWg8Y594iHxd1KfaE4SjgdB7GccuUEJ6bkOmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TaAHRh1r; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TaAHRh1r"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24611734e50so186485ad.1
        for <llvm@lists.linux.dev>; Sun, 24 Aug 2025 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756053586; x=1756658386; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzbrFRokTuoA/BGlN6chg/kU+YDV0lrR5n5SZHBY0yw=;
        b=TaAHRh1rifiy4kLhqJveLIaDu10XWujFny7XlaLRQlEnUhFTAsuYMVtA2qXntU0TvR
         rbYTsa/sMEKoBydI7lhEcCfuRGTOUe+ipflowWW8lgICUgicm96feR3FAeoayY9fU4W1
         NFYOPCFnS1Z3dWg7PrZuzY37NfE9ORb4wACocptKQspnpw4ooKeH0Q/oHvzV01B0qYHm
         pTjecQ/FW1nmjFR1+1tY6wr3Z2OXRY6Ah1gFMsKvmtlUvR4gMN4yl5hOYel3bKKLLLWo
         8B1zy++9NklBeSPVSHEKFqx1oi3E4/h8zcdtKQ5q1a7nrj+xA/iYOBORpDaFTOnvsP8G
         C/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756053586; x=1756658386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzbrFRokTuoA/BGlN6chg/kU+YDV0lrR5n5SZHBY0yw=;
        b=QxOVJ1yQrz6IsAO98b2LtfqD8YG0qqddhvDX38lXT9UdBspMGeefiZCM14La3BDYoV
         1zTcxyo4tLc0PhtPIeQWlhMEpVtlrnaZWa/+loIFcZNQipKyJC+n/3ucUZ15lD5m78U4
         IOFyeQa1YBWsNjoV/T0YCSg6p5sPnBN4Pl0HajmxHjkFM1ZDG0R5+H7H2z3BSLvRNI9N
         +jjWlrUZ/AI38+5+PMrc7q2ZOKSVXqFDgpWBp/W8bNr6mxTQuHWuvWBLCS6IeOiojpmA
         0z1NsXmHlv4hsH2ERlGL1//9qmdjJMd8Skn823Ad8bd25Gi4zgEdoXIXCXl8X+D+D0bi
         VAHw==
X-Forwarded-Encrypted: i=1; AJvYcCWFxQqx24E6KUqSqvSt2QUHKPBVOF6JjLbwT1IOg6zq5TbttJZo8lrLaECK//r+djiKM4kV@lists.linux.dev
X-Gm-Message-State: AOJu0YzGE5I1SBUyhjyx515kMjrG0cuAPylJNTVK+IxxE52HZQ5lGdHm
	yefjDXOJgZSNh6rUNpfc97woOfmsnJHdjTaQLYUiZKRiq4sdl1ALrwwMYaCoHEjN715Nx8saQSU
	5egVTiwVZqDryeQ7dR9HhfdK5FET8+F/7vmCe+wWL
X-Gm-Gg: ASbGncs5LSyNZo4DTbV/n9qbwJD+qHwmooBCZF0+0etulDtMrtw/mh/HX6tZnVN2CVh
	gSxHlBHM8vkhvAG7bNTc+unpAmx5QUP/8F1B2U01xbSDKF+8/Ck8CuVLPDaETtQk49RO4yvyxEh
	FFm+3Uc/4pZkP03QyrntI3ijDWM+Fp5PTptpYNeFPV4ruXT90/W/AKtU/+W+E/QWIzVuEprslXO
	6LTW3xoyWQroR6yFaPg6qFAng==
X-Google-Smtp-Source: AGHT+IF8ztkEHXB7jHNLH5b0qoR949xdKvlTltrfHLNI9mn4T2PAdsWoPgL0Nz5jySsDqNoznj8VNBGkS1VgvZI1Uk4=
X-Received: by 2002:a17:902:cecc:b0:236:7079:fb10 with SMTP id
 d9443c01a7336-2467a21e4c1mr3101485ad.3.1756053585241; Sun, 24 Aug 2025
 09:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com> <aKpP8yn7hoyQJe9h@tassilo>
In-Reply-To: <aKpP8yn7hoyQJe9h@tassilo>
From: Ian Rogers <irogers@google.com>
Date: Sun, 24 Aug 2025 09:39:33 -0700
X-Gm-Features: Ac12FXzo4nNl7CWXzsGv5Kuj8o4HmwvIozQ_8cCU8zkwDdeVOkH53u0lihj7JbY
Message-ID: <CAP-5=fUa6xcn7j6_SGrmK7pTPTcUADodXo6o3UTLbFWBAeUUAg@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Support dynamic opening of capstone/llvm remove BUILD_NONDISTRO
To: Andi Kleen <ak@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
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

On Sat, Aug 23, 2025 at 4:34=E2=80=AFPM Andi Kleen <ak@linux.intel.com> wro=
te:
>
> > BUILD_NONDISTRO is used to build perf against the license incompatible
> > libbfd and libiberty libraries. As this has been opt-in for nearly 2
> > years, commit dd317df07207 ("perf build: Make binutil libraries opt
> > in"), remove the code to simplify the code base.
>
> The last time I tried the LLVM stuff was totally broken, couldn't
> resolve many things. The only workaround was to go back to the actually
> working libbfd. Please don't remove the only working option.

Andi, did you report a bug? Does the non-libbfd stuff work? Yes, as
every distribution has shipped it since binutils went to GPLv3 (in
2007?). While I don't want LLVM stuff not to work, bugs happen, libbfd
is license incompatible with GPLv2 and maintaining it in the source
tree is a burden. When something doesn't work, create a test to repeat
the issue and then we can make it work and ensure it doesn't break
again. In general I've not had issues with the LLVM code.

Thanks,
Ian
