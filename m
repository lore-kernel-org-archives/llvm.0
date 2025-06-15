Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194C41DF248
	for <llvm@lists.linux.dev>; Sun, 15 Jun 2025 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750022292; cv=none; b=s98ku0fVoVrf3ow1WQSvMJxAOB2b3Na2D+gZy8mpX6hS3n/LBBPJHHSi31DE0XXRNIetCwJNbfAiPC7BS8ohzz4peEW32ukBiD/vxe19u6g6HovbVOLyI1rFIylnEDtDppOJ+kQ2EJ5MTQSa5up5DZxlyFfYh4Z1zfGysrV+R2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750022292; c=relaxed/simple;
	bh=Ky35e52EIfbhV8BPsYNhSX7ybhbD4Ajlg+RXV253gFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBQ9clxPRXwrVtrlfgdTTkwKvTzMQ0mEDCXNi3VqYohpu3hrIzb06IL1gGbj1Q2mRLckhrKcsGEaQjQiCvhCis/mGyl8e2S8Wk5A1gZJDtnOGkvdU8Q/Y6CdAJmAsLDcrff3br8/1wgVY2YBQrq5X2swJmr3rwsnhxNHxBDAPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ygctcaP/; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ygctcaP/"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47e9fea29easo363391cf.1
        for <llvm@lists.linux.dev>; Sun, 15 Jun 2025 14:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750022290; x=1750627090; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kbXAdW4yCyx3+5ff6ebsyeCYa7wKjRonHdL8V4+kCCc=;
        b=ygctcaP/GILSYGaPTNnnoZ3P+g3JyYHSsHjHGOSInL3rCe157O3CjJVXyoKWYjN9/v
         j+Zp6dZDlnRXD9Lq4L4nlv9KagsJGvo36Jpvyjm8rWFLlFTZJzOLQn8tZ1/wBAGnrys3
         qc4GoObcwBP1/GJOexCUX9FqQaXoU7i9E/mLKQBS+hI3wG+Mz0OGqmkrw/z+4xC1xBb6
         cszK6I3cGRypbepnO0FwtSazaVPots1eVQIHUB+N8p5MuWGo0cUCzOfyaAZ2sCDioBVN
         7Fk1LJ7tJoH8Hmu+cQVIpa7kb9yVN8Bg+rbX4Z8JfGKAedWVlK22bRycjYIF9OATdW4n
         WnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750022290; x=1750627090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbXAdW4yCyx3+5ff6ebsyeCYa7wKjRonHdL8V4+kCCc=;
        b=MncwykxWqicQP8T15+fYWglc9CPJlwuivkmRcJ/2G0a78ttZx827/b7FICvrfKLMGN
         NnXhm1Xh7iwnYnD6UMY1yyQONQHHY8DVqADU2T62tcLgIC6OYnr6Bxt4x7d6JpJtZs/Z
         vQxzAE1RYrFyxJywOlISYjIlspGmVQjKyFAIzjFJUMum/ddTTwMAOqALl3pEZVaGWKYX
         e62nUeFeSXK87tN52s08/RFJ0nX/sKRazhv7g06XnbdVUtDiATqsG3Wz2LhF2GRrEsna
         KbzC42EjXRTBvFZRCroXBP5sXNBKfMdzXt3Omg8wSDWvbEDWeBswFO/YXSX93P+wQUTF
         LHHg==
X-Forwarded-Encrypted: i=1; AJvYcCWCtM2JEbClChtI27DcBJ2OmvsTb1PcqbnQR8TRpccNx3fp71+f/iP5PSSAljluGJi4hBSv@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Km5oOSfhArIQYKuHfhrwhh+9YTmUB5OOMj9kLpCqMR0wmak+
	giff65NvPs50FT+kW02wEFHDP0ujKr4ys+OY9BSUexARWVlMDBMHtnJ9HbzK6QWe74Hm72XNlmx
	WSIwf/l8XSLgbKxsf93bznHtOrvdOtITm6Cmt80Pb
X-Gm-Gg: ASbGncsDCEUembmZ8xY71s29H+N6xRZYCD+bg2XvXBQYimUbtayoagX0S7sH4vhMgul
	TLaRZx1+sc/JZkOGzyxabjAw5AMYFXGl7sAiHBdX37O3g3aDbKQ/oeIACXv6NtJvW3l0+H17ocY
	ult/jBSL00EL2r5Z6ZKz42qkriOKE2AlE1mYe5/mYqck+JLqm41J/E
X-Google-Smtp-Source: AGHT+IHyI/giLHDVc/7oPe4Y25Gt2jV0dsA6547ZDZPHEOCQg32XugU1twVIDGD6RTN+indIRIvFdvKPkx2AFVBIUl4=
X-Received: by 2002:a05:622a:14:b0:4a5:9af6:8f84 with SMTP id
 d75a77b69052e-4a73d63d94bmr3695771cf.14.1750022289596; Sun, 15 Jun 2025
 14:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250614003601.1600784-1-pmalani@google.com> <202506152245.BJAubGbp-lkp@intel.com>
In-Reply-To: <202506152245.BJAubGbp-lkp@intel.com>
From: Prashant Malani <pmalani@google.com>
Date: Sun, 15 Jun 2025 14:17:57 -0700
X-Gm-Features: AX0GCFuTWLHc2ZNlsl7lAd0ZY_hlZfWYDoaHvW8UG6RUWnh-8TbmHsZbKEHTaNY
Message-ID: <CAFivqmL4BPX3seUykFiSpehME13OdwKBoefnxw=owJyvggw30Q@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: CPPC: Dont read counters for idle CPUs
To: kernel test robot <lkp@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Jun 2025 at 07:28, kernel test robot <lkp@intel.com> wrote:
>
> Hi Prashant,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on rafael-pm/linux-next]
> [also build test ERROR on rafael-pm/bleeding-edge linus/master v6.16-rc1 next-20250613]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/cpufreq-CPPC-Dont-read-counters-for-idle-CPUs/20250614-083659
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> patch link:    https://lore.kernel.org/r/20250614003601.1600784-1-pmalani%40google.com
> patch subject: [PATCH] cpufreq: CPPC: Dont read counters for idle CPUs
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250615/202506152245.BJAubGbp-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506152245.BJAubGbp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506152245.BJAubGbp-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "idle_cpu" [drivers/cpufreq/cppc_cpufreq.ko] undefined!

Looks like my compilation .config included the header implicitly, but
it got missed here.
I'll add it in v2, once there is consensus on this change.

Best regards,
