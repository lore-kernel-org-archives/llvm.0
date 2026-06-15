Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0695138F934
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558807; cv=pass; b=m2fK2lnUQYYN9u7SZadrhPkUWo6Y0UODEhydCd8XiC45VFM3GI5lL+rL/1cKqxOvaYHWqU4TuhYiB666ReSZ0E9JZY826uWmkPATSL0aFt1vI0ic2gioeWN6q2eT6oRCDhOj8XZIUIV24bZJaKBWbhnMqmFITPM0tpF5F8nMDNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558807; c=relaxed/simple;
	bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmBch2o3HRSZIjflWEUwR07UtJDEaxI6CoaJ3oHb1x0AunOdHb+4SpebRriGGupkXjDlGlMuHHURKKBwfH7oIakkwXC9oagUZpsIwW3QhWV4RlyO7n4Bvixu+2C5Ud3KeSprC95pIZ6R+0siuymTKc/AAWr8ZjMXW8PGDrmC5hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JK0kWoDz; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JK0kWoDz"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so3733a12.0
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 14:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781558804; cv=none;
        d=google.com; s=arc-20240605;
        b=Gv2Ax0cgHXEbDIShrpQVkMeHTlAsVYTeHECgYag4rpaoYNHn7Zu7LFUcAn3Ez20iVl
         tvJuB8Yq1hyp6rcd/37qAatSe1XCj40bbBCMd/WOdtGxHNnFnumDRS5+8Pi4N7sUCT8Y
         f6yR22I8JYBY/VmIQKpIpgk95a5sHTkvBCYn94GS8CtzPbvQUvMw0mhL/h2kRuR4u5Od
         RQ/mz+NSfLEo2D7iS3KqrdWrrMZ0NBitZS2Nr8CogCrRHF+2xgNWjfUVQu/UgxFgV795
         DFpI5O8eN6zaV9jOoFUMg5AxEoT078T/TSJs9ZCZcFkzWwfOLfSMxUz9PfOk6Vxs7+/S
         7F2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=;
        fh=NiNJo2t8jSjsKnip5E4MQnm1K29k8U2K/aeRXfzGHqg=;
        b=S/hL+/r24IB285DYGAGHHsECc3+3Nl2tEB2lfk5RJWUZHJwHupqjzlF/9VszpX8Ovn
         9X+/xsR8h9ymAEH2abqoYJkhNZC6VUXfj5LIpJmzaRaz10jW2gJ8cLzINSfZaO9U7VLn
         8eUVhJVXPactoWiPKLPZ+D7tTlOh2l65AdTlWON3C2UQ0/dpyNrn3PrnQMK1PhUvbGc9
         LEwNJ9idZacdzkQ1GOa9aIDlf5X7W8x0vlVDbvdkc94pALF/RjeigOWYm3ouqnVgbcmx
         4kVRPKcqP6GQrACZESrirPcI5CbWJPHoJ73C6CGdmC9NV4PAEHH7lObeZ4ZI0upLrf3X
         q3ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781558804; x=1782163604; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=;
        b=JK0kWoDzM7X6Ybj9lZ8z1UwLN7f8DEEzNHZ4DUHb/hWQHcSW0d5kg3LEO9rKOQrylq
         UA5GS4EyPWgvVTJHKlkYzne6yFpWG18yZhy8Z0wHVgGvX1mHCb4aYEJ0dKzisfajZYNl
         6opneVDmmFSMOA94mbJXZCcxPL/c0lguWQ650oIDsXXXX0QY5A0XJcwlqy0UxqhrmID/
         8s60cxmXPATdVptFciafO8HCMKPj5YFD94V7tfnR6KJVp50Qf4ncCIiFZZe3IOlJ9/pe
         2jXnR+/H0x7dMib1d72veJu2OYS+61ht2wPEGuzUqOdVOEXdCWC1vF9kKI+XMzRGYQ59
         Dwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781558804; x=1782163604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToZuC56F4bCiUTbRp3OuxSWwbRuPhht31/r/OtwBpF4=;
        b=AB+gEA4bq+HGn/+EccBWugP3HTVY9OgLBXrjLAfIPDRRZJWDHUu25sNBVZ8hq77Qhr
         JGWGMxp2WunIBNrDMEGjnCz8mCUEN6d6rtYexszdUBUjveQlV9jfUmoSSkbJSfla8xXa
         miVJ/JP+nv/uox4bzLxL5SeiaQOFsR306QXpvFzr5x7PYUodsAUMEkCmR3mMfyVO5lUI
         4Dxpzr8zFW136AmU0MLHEgvy2S+d4Z9rPd/Hrj7n8XGPG6bw9FYv/toQRVI8Vz/Z0wsN
         qsWtytfW5mJVvqi89Ee96+xXtc5I1UO/PfWruJOxCpTd7X8PMsY361MBEnC3Fg4Ti7rx
         6OyA==
X-Forwarded-Encrypted: i=1; AFNElJ8qHAKXHhTo4bTw0hkvjTVEHIQdvqoYfDwZPuuL4QJ1F3g1vuzrPE2hzL1snbmq6BrwXgOv@lists.linux.dev
X-Gm-Message-State: AOJu0YyXU5QrcWpjvWMnbt/9Mty92XIyVCZDmXWi7wPGsbaI4PZFylgk
	HgL6XcYLgUzSCJD7CMxyQMuK4QPiRmO5qzzaIjhdQZPVXFJOkRmzuvxHb2UPYMnU61N/AhXq7Hy
	FYfBNB9iVH5bZJps0O2l/DZMEpzrY7TSiU6mMcMJc
X-Gm-Gg: Acq92OF386gI0FVXjmRxY4B/86QyM44l//fYHFBrlTSJnZmKcj7E7WnH22pWZujkieF
	Xd0rOd7SGJFzYLBwsKtAPwRHTJWK9lQniC9gRd/+CdJ8zM4/mVljvldTtE1J1IbRnz9sY1W5NS7
	/4g7N3zehdPzHGyIeylnzqF+9QHBinbYS8dCkA8FkiLKrT6zXzgkbLpi++upK5AyLKROj/yn2cX
	TB+tqAg3Wewhxx7+Ojinlqe0+W6Pa/IyPc+5QrvDLvNoON+zNabfkwARk4ezKzpd6sNO9+R0cvQ
	kGI3lhTViBEcWW12SpjhqiLkVurnZk2fW1D4AnkI6ZH1L4bw
X-Received: by 2002:a05:6402:684:b0:683:33ae:8689 with SMTP id
 4fb4d7f45d1cf-695085d13b5mr21597a12.4.1781558803963; Mon, 15 Jun 2026
 14:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612162257.896792-1-xur@google.com> <20260613170143.GB3152432@ax162>
In-Reply-To: <20260613170143.GB3152432@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 15 Jun 2026 14:26:31 -0700
X-Gm-Features: AVVi8CfiVeC4233aezHEUet34ga7TDorkoyE27yShVwTmSOfx7cYTcOkCfEkcXc
Message-ID: <CAF1bQ=S6OMwWuA=xaKy4CNvCmsAaJ2DQPi5LnfLyu6x4RnF61w@mail.gmail.com>
Subject: Re: [PATCH] net: correcting section tags for .init and .exit data/functions
To: Nathan Chancellor <nathan@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	=?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Yue Haibing <yuehaibing@huawei.com>, Jeff Layton <jlayton@kernel.org>, Kees Cook <kees@kernel.org>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sabrina Dubroca <sd@queasysnail.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

After studying the warnings further, I believe this is an incorrect fix.

Normally, *_net_ops structures are intended to live in .data (permanent memory),
even though they point to .init.text. Modpost is handling this by using
hardcoded whitelists to allow these specific exceptions. However, this
whitelist is
failing in ThinLTO because ThinLTO renames *_net_ops to *_net_ops.llvm.*.

I am withdrawing this patch and will send a fix to modpost instead.

Thanks,

-Rong
