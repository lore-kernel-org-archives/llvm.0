Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932B1DDD4
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="phSh84vO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3366e78d872so1922642f8f.3
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703003066; x=1703607866; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uNwkU9kqRe/iMS3l4jAnLfwvJqCmqKLT4regqpL0b4=;
        b=phSh84vOmhbVNruqvRNiye4dGSlUCw8k8JYILjIFwcaIbQ7hRmpTTtMpnko0hv/2SK
         +OI4g+IOv8ubzzcUWkUcxaPv9Pk624ij8tinPdbkun5ndcBgPDbEK0+VNxwuzKeNLVyW
         jxXZ1XXUCyKq4XE7JRh6dFKMa6nRSa7xEYSVXG5sFERCUqrgAgm3KFN+/wyscVIxak/Z
         4fiPSfvxLLOriWgvDXhdQ+FsvN0lZcH810dWwxdCbCisRyrrhEfO0RwROGo0x6zn36tI
         fKd3oRDVC3XllmW+fJtHFPj5X/58x/sYbjZjb6JOMNxiuLWxFZRIgIyRkzsV67ETJtgX
         NjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003066; x=1703607866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uNwkU9kqRe/iMS3l4jAnLfwvJqCmqKLT4regqpL0b4=;
        b=Mecq+MjrVpQ9r1sAI1O8DwLJzqpiQgmT0LJQ1qqm6Uy9agJ7mWOo5e2YHmKRw2WEdR
         b0wm+ksBf7FXRuvQtaR0aOpZWdXnqXoww2op42G0XpMER55GeniZ3TveILDn9xKGebqJ
         hQCKvIFbfO0b3RJE4FlSjSS01aDNyLYFzAORxkynzm9oVLjAFlH1dOixa7xXcOosLzJX
         xBKYtqoR2S8qmbYKb6BZpmPeKDlVFmoaxzDzI94A/CT2V6lZcOjDA+Vw+T6hTWLyBN7r
         +7w+JTVaEelwJNq0K+8RCGyu6wVnNnA/V9S2HpEyr+2iEy82AsNPuVWDb5V/O2orIg0f
         quJA==
X-Gm-Message-State: AOJu0YwM+QzuGEyJNT0GU394RxZYjFE/GF2jYzG1Fd7kr2rIDxseG1/+
	WGZtVIM/0xBvSv6j8UbXOOuV95gYWNmxCwUTo36Vog==
X-Google-Smtp-Source: AGHT+IH1fQpHrgQ1AQ0sGIpdVwNAENGWCsTtuPMZEL7iT/lV+6KhEOFjQ0f7EQjww7MFIhQn55pIpmcjQyZ4enkYLwk=
X-Received: by 2002:a5d:6786:0:b0:336:5162:de5d with SMTP id
 v6-20020a5d6786000000b003365162de5dmr1714276wru.227.1703003066507; Tue, 19
 Dec 2023 08:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231217-i40e-comma-v1-1-85c075eff237@kernel.org>
 <CAKwvOd=ZKV6KsgX0UxBX4Y89YEgpry00jG6K6qSjodwY3DLAzA@mail.gmail.com>
 <20231218190055.GB2863043@dev-arch.thelio-3990X> <CAKwvOd=LjM08FyiXu-Qn7JmtM0oBD7rf4qkr=oo3QKeP+njRUw@mail.gmail.com>
 <20231219101202.GE811967@kernel.org>
In-Reply-To: <20231219101202.GE811967@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Dec 2023 08:24:11 -0800
Message-ID: <CAKwvOdkLx64b2d+F1CgRn6duxhUDNWfdj7mRuoScu1Jz2H4mXA@mail.gmail.com>
Subject: Re: [PATCH iwl-next] i40e: Avoid unnecessary use of comma operator
To: Simon Horman <horms@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 2:12=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> So while I'm all for more checks.
> And I'm all for only using the comma where it is necessary
> (I suspect that often it is a typo).
> I do not get the feeling that we are sitting on a trove of nasty bugs.

I still get nightmares frome:
- commit e7140639b1de ("powerpc/xmon: Fix opcode being uninitialized
in print_insn_powerpc")
- commit f7019b7b0ad1 ("xsk: Properly terminate assignment in
xskq_produce_flush_desc")

--=20
Thanks,
~Nick Desaulniers
