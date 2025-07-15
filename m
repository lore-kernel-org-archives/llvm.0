Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B22C1585
	for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 22:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617646; cv=none; b=QjxQGTMGSErgjzmqKitGx5J0pqkuY1fu5q606lP+I9yfoJAtPW09o6c844ZBhnH2YM3ALCte/PecCOwLPpI292Ml9ax/UIq9d4g+onrMiwkmTkHdUvuCb/NJ27iep0Am6eirwJ3mSwfh7WC5bSs3+6Ng7/QZarUXQFcJBBG1AWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617646; c=relaxed/simple;
	bh=9unkbb+digCC/RSTta8zvzheszaF3akf/FWo3P9GnFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uoz+ioWsUsu0RUUlanpmoxR9/twIaNlefygzbWJfV70VYZtaucpE0+zEzKLXJIggO9UUxn42PgfldWqDdbgfS9rV4lhxolqd6d+TgcO5fKsjUqvdDqg0jjUPbzIMXWZemI49qkedj8uKwMt9mNyi83JpHdniGSDv0x9EWopgGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rc6vYCHL; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rc6vYCHL"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235f6b829cfso42265165ad.2
        for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 15:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752617645; x=1753222445; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLj4jehQsIo073ngckKcOxgDkyfk0C1kjZ6lTDpSxro=;
        b=rc6vYCHLjYd2s7ZTgqoE29M6YzguWSQxW2kjrR1aJzmp0swPX2leJ+yQSjuS1G+Wv1
         iwK/xkvbMKObq1YaSIaIe0ezEB7JGrm2jOapIVmCnMkPwzewz2BNGQMwobNR7pfeHjWD
         tIeIeo0aApb2tKTFnUTqPDo1ab+Pbub/mGTnsmLHr+21Uuekf0+XkAwEO9ASbUfbEgtR
         Dftgppz23Fi8Bjf+Acqqe1/E/fLgZwrRTcFqghsz/Ucig+RZaQJrlQy6YwNsgzCC8n+6
         FAzKZxZYw1aoolZ6S8UwdOsxVIMh7haqpx5glP/4sWzjEi++TZYaFxzeNd5XGiySYyKn
         0kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617645; x=1753222445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLj4jehQsIo073ngckKcOxgDkyfk0C1kjZ6lTDpSxro=;
        b=WHDkzVCpNU3WuMdam7jQLF/EnvEcLgRfdT6BMXMJdqQG2O6fSbldMKUf2lkkn/qm3/
         1gupC2ymMZUli6/IBwxR1maxYyz1qTJsb76APxFE9aV5LfSJwhWtpR72A/2Gpt+7zOOE
         lCtVmTw1aCu/qYbWBD8mhmZ6ia+NZ7eJjT1ODExLh2jv8q6hJSueksm5AYU5IMLsUDd9
         sUAkTGO5GFrPqhZe/97BkDMrXvNont+Z2Bp0nPIZ68ecnrCxknOTU2WMzZQgKYBK89q9
         GBx4b8cf9lMh/R7/6v3fNk+6MR9q3gRpGZk0FteqnT42E7LHkKJgvwT+hiBQVW5xcW6h
         lk7w==
X-Forwarded-Encrypted: i=1; AJvYcCX2011uu3n0Hbr2Md7vP4/k6nRO2yCCQWpCvzFy46W9jwb7k4aKECgMUD34ox5ZhdFD+6sZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyIjLxYX32uVkpor0/msE8Jt7fvPkOftTKhj+kQZ7kMKQdOdbx7
	o8qfg1Hxj+I6/GbIQvEb+B8notVe5Q6JNGRSiNqiAgb8ta03PRPT4G37PE5CVykE9qedzC2h+bN
	hkqXP/w==
X-Google-Smtp-Source: AGHT+IFQ6KNYaLj1GO+LXqw7FJLIO2JGvORU6MZLol7Oecx/HZ1VDHVoLnEBoRV3TIoB2MYd2sHC045nRJM=
X-Received: from pjbee13.prod.google.com ([2002:a17:90a:fc4d:b0:313:551:ac2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:fb0:b0:229:1619:ab58
 with SMTP id d9443c01a7336-23e25770d12mr5431475ad.43.1752617644715; Tue, 15
 Jul 2025 15:14:04 -0700 (PDT)
Date: Tue, 15 Jul 2025 22:14:01 +0000
In-Reply-To: <20250715201637.GA2104822@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250715201637.GA2104822@ax162>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715221403.1339526-1-kuniyu@google.com>
Subject: Re: -Wuninitialized-const-pointer in net/phonet/pep.c
From: Kuniyuki Iwashima <kuniyu@google.com>
To: nathan@kernel.org
Cc: courmisch@gmail.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, llvm@lists.linux.dev, 
	netdev@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 15 Jul 2025 13:16:37 -0700
> Hi all,
> 
> A new warning in clang [1] points out that dst is not initialized when
> passed to pep_find_pipe() in pep_sock_accept():
> 
>   net/phonet/pep.c:829:37: error: variable 'dst' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>     829 |         newsk = pep_find_pipe(&pn->hlist, &dst, pipe_handle);
>         |                                            ^~~
> 
> It looks like this was introduced by commit f7ae8d59f661 ("Phonet:
> allocate sock from accept syscall rather than soft IRQ") if I understand
> correctly. Prior to that change, both calls to pep_find_pipe() were in
> the same function with pn_skb_get_dst_sockaddr(skb, &dst) before them,
> so dst would always be initialized. Should pn_skb_get_dst_sockaddr() be
> called before pep_find_pipe() in pep_sock_accept() as well

This sounds good to me, and AFAICT, there's no fix queued for this uninit
issue in net.git.

Could you post an official patch ?


> or is there
> some other fix for this? I am not familiar with this code, hence the
> inquiry.
> 
> [1]: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e
