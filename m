Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE4495DE
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KhMsPM6m"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33660cf2296so2403839f8f.3
        for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 11:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702926533; x=1703531333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VjLnKurb94JOJEc5/JiQM+XH6LAGsKmWg8/mQBR2hU=;
        b=KhMsPM6mWlbKsN+gvmuhFLguUmQu84XBau1PZfwQs7Ij+DwY93gIXkD84iBf31kD5Q
         T18Lo9wo6GF54xSaTqDqcIZ6a75Nc/W1Hq+xG2fjLWImUrcRa1nV9hfTjB9CkMcxnvBC
         LjVMv5mS9NmY14mC5qN3Ocpxj/TLGagEBPIiH67iYlbcgvfQT8WsI9AAEYo6+02YVsCr
         K4rCGs6L5q8N+v3wsTJSLJC3LswDzoG9RFTltyFPSsxXIg4UJetQWzNO012QUEWPqZXE
         PsI+vn870gpmRzA/I80rAJTBa/oRvH50Rcgaz9Hw8LMxW7aaVb6lDVAsD7yxnj+0FUqh
         s/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702926533; x=1703531333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VjLnKurb94JOJEc5/JiQM+XH6LAGsKmWg8/mQBR2hU=;
        b=NM+Ivl87hWgMyw5F38GiIj4NidooMBrlosSQPBMZvpzOH/a2/nptwjsRS0Y0t4OKFg
         NYj1zUmftvEMLbko5izhUeC/hILAdwTMk6SPK/N1sdHCF2BFuq28jU/qj8nq68NAnFTs
         Ux38f0DbPCVR9IPrGFjkHzo3zvC+HyLkSxhkPviuG7AtHpibiN6U4FK6i9nocyFBbnRK
         v7jh/jvcdrTXC/FBIeZY0Psg2ugx+NosB0ID3PBdcfSWU1H8X7RRUMEUfstvwAtOVnBS
         ybqMwpSMOP633kZXzFoLl4BLblXvmWIbxqBfxU5a6DzKAjEeQjJVWrzHOY3uwxGow7cH
         /3Kg==
X-Gm-Message-State: AOJu0Yy7Q+nuQdLMKCL9bYVvGB68uo+WClVsgKKFSXnxlhkKSV1hIXHL
	zGY9IkZMe26KmQIrCesjFqsPVvgyP3MOTkHPAfPKfg==
X-Google-Smtp-Source: AGHT+IHaFdfIEpO3fZUTL4Wf2Y8HPXZH1xwNOjyaIvh0OcsgRhDmrYh6xFp6oxBL15Pvv/pP34wDIwpN82+DbGf4Bh0=
X-Received: by 2002:a5d:488b:0:b0:333:2fd2:5d2e with SMTP id
 g11-20020a5d488b000000b003332fd25d2emr8604653wrq.96.1702926533113; Mon, 18
 Dec 2023 11:08:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231217-i40e-comma-v1-1-85c075eff237@kernel.org>
 <CAKwvOd=ZKV6KsgX0UxBX4Y89YEgpry00jG6K6qSjodwY3DLAzA@mail.gmail.com> <20231218190055.GB2863043@dev-arch.thelio-3990X>
In-Reply-To: <20231218190055.GB2863043@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Dec 2023 11:08:38 -0800
Message-ID: <CAKwvOd=LjM08FyiXu-Qn7JmtM0oBD7rf4qkr=oo3QKeP+njRUw@mail.gmail.com>
Subject: Re: [PATCH iwl-next] i40e: Avoid unnecessary use of comma operator
To: Nathan Chancellor <nathan@kernel.org>, Simon Horman <horms@kernel.org>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 11:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Dec 18, 2023 at 08:32:28AM -0800, Nick Desaulniers wrote:
> > (Is -Wcomma enabled by -Wall?)
>
> No and last time that I looked into enabling it, there were a lot of
> instances in the kernel:
>
> https://lore.kernel.org/20230630192825.GA2745548@dev-arch.thelio-3990X/
>
> It is still probably worth pursuing at some point but that is a lot of
> instances to clean up (along with potentially having a decent amount of
> pushback depending on the changes necessary to eliminate all instances).

Filed this todo:
https://github.com/ClangBuiltLinux/linux/issues/1968
I'd be happy if Simon keeps poking at getting that warning enabled.
--=20
Thanks,
~Nick Desaulniers
