Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E832AADE
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553926; cv=pass; b=L5fdzhw4tEFFH3MOlJwolpRV/TKWKqytEtzvQChZDtMh4sHgLJj5qcuKlgKeJ+2Eax8UO9l6dKOD5RFA4yR4ThErYpZrsnXhMGXH5u07C5R+qcWlnMGkSCi24m/JRZ+02ncmEeCZ+Dq308Zpyw+BfC4k0qMS+sEB7mMwFppN6Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553926; c=relaxed/simple;
	bh=Db4TAAnVc2T0Rf7Wc2cEY/pwtSDY+KMo+MImooH/kK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upTm4HlRn2xyO0jDVWmXbisPWRmERMG98ZN3ZXHiwO+sgawgxdHKYnVN3/sDzsZcBfalUYTTN/1h7DoPR2diy8qqPvemRBqkK2j5C+sphcz977HskXMelIgAPOHptPqBktzwHDeP4wl8+v/Pr5YoVNuS8tR7YTOS8w3cB1tAT2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BWXYgI2h; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BWXYgI2h"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1273349c56bso1761946c88.0
        for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 12:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774553924; cv=none;
        d=google.com; s=arc-20240605;
        b=jojtVHCE+CD5xOq5U4s+4vrMYnt/Xn7ZaFaRFgQAZG2ogDwK22rRC5ljmgM4AjrAnt
         48pz9HpxuYXZ4WBTnuyxuLRv1a7GQz3PyGR5zBkSOO0bo3bv0mMN7zYmy82nkZdQwg4G
         PCb0V+dSfOsfr/BpLu6Fe9am0T9PL8pgCQ68yJu2QS4uBc7WPzn3Nq9DTxLw0toWBfq8
         u8cC3mU1OhqHDGrhy+EwROoMhuHh/DQSkT2pLqcwzePPr+NjEt9ZsAEfymcFQE4mn/Fv
         6U1m2hnKKbKriQD56CIFXvW5npM+gNg6//uOet3RLIbyyYVYxJuf0r732Hfn/FgUjaP1
         4Ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        fh=wrjCpa2WW6bR+amF1gyuLjJkDyQt9F0W+n7WEJ1OiZw=;
        b=ZJ481fpZP+DM7w9TguGZaULR7YZdDF9T8j2qnE0JaAQvOk/NH6nzvMEweLcs9hZLmt
         34jVun499dw7kq/mKQnWnhF8y5lvFzaMdHnfvtGu6mlAATxcagrPqqypakn7aExc0VrN
         VC4oj3ew9xomF4gQ5XW5vZcvEZxYwNv16SvzY1aWC2bu3VWxt82D8ebwbZ2ko8OSyYCt
         B/wReWRMg6EZ+TGT26P+t9nZozQ194gSnh5LM7Yec7z9xZmsN/sra+dKNKrGLeHgynts
         b18tkZd5IrnNN4M7WI9fPpfYHOmMF5wdr+WfGckvoJ3k/wbRusuijfN3W+oRW55jZ3ZN
         x0WQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774553924; x=1775158724; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        b=BWXYgI2hz/ab66GayiQ6/kO1qKihsksrT/mskBNHZWRezMNbwLWmIpVwk4BuO6Sr7U
         elKfhDUYZLLdZAi8Nyov36MFk6f8+bxtwstCZyuHOJV/6AAGpV4NJowcma98L1D5HzGs
         TyXkLmtH2JdoEvZSzwIZsPnCQOx4J3dWVcJFuNIMbwVPnDc78zaapZBxvJHtdOBMN8oh
         UhdIgjNWTsWPtVbrZqS/u/zcmNVlHlXe9BcjPaVQN6QBrURF37B8Sx3WTAGP+2/QDKoA
         HMPXFK4jGXEDKSfbf2gZeH0Y70CX0gsu9ftaMzBhHqliU1CWzD1i9RLFMLQTrYnBHhWC
         JmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774553924; x=1775158724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6mCMJ7IYsFJz0Hh2fdQYOLxKjKcxltIu2zRqwDNj3FY=;
        b=DgRIMDe+LmMMJUvv8m0mwVmAn01Pm6sZBrQnnq9qJYKwWgxN7XCcowN0QJ+71/bDLd
         ndjAKWuv12V1LUyUwf2eqBMCRuWAnjG3vE73zfQvmSu7XcBEhWgYx36uhNm7gGncG7gg
         W/2W3OKbS/WrsRtkJWgDG/IhWZDEsuHT/J/yBfxqquD328JNDhcHI4v5cTjWN1Vkfpnt
         Kjh2pk2vwgYV05pMBaigjSeXjsdvQu7E7sYYyRWpQIAa17Eyd11uxtJIgRmmfwbn3Svu
         TvMCicpb8PqbvkKCO/h9+G7IvZmt4koebXYQYvdmdKDKo5Mdj4iPWlB7HusWvdjGb3SZ
         ffUA==
X-Forwarded-Encrypted: i=1; AJvYcCWAxYgivPPv8hd9PmZx2s+fTuYPfIIsqcfv6/YF3PrhyPuOQCCHMq1z+4A1uquGCf2Ylc/w@lists.linux.dev
X-Gm-Message-State: AOJu0YxA8Ev9yKjAPo/kW2MROtjCaQ5wLrBRu66BfofA1bet0BDMDomw
	4NNwbAToDlpFh7zmHUwHw+aJUbpluadudpPzlnYuWNQjzUOfk36fAvPXKS9ZxaMabGaAUAJKt0n
	Kc39ut7jTUXQnWx0Uuj4KfO9wXLYKO1DNp+9jAdUNOq3GZhVTYjGKebH7
X-Gm-Gg: ATEYQzx9TNrKELH41yv0ArhA199GADNcfJLi8HQ2BM67FlqD5H4/FTArT3CgGYcd3Nm
	JOYm5Akz8TrW/wH+l8wN5iJpojc60jngNnrK3T44VnuXqvt3l8UK2wEhFLL+NLYrVQn2UhLDs8i
	AyQ7cWYaeDu6cYIfKsE9H6q0PkMwYeKx7XfWgUgAvYy3UmNVFCe6iH0UOQc8s8TASqSL77hCXou
	fSreGBmtVL9t+E+6ns2Nun+jWfby01mkny0RSdvzDyMdpt76ZQLuwsfXW5EpkUkpXxTp+kVj44F
	7XI8tTV0qdUK1rf4VVSJT9nLTItZBOU2hSq4A+piGS4Rzw9CU3/YBJCz7nDEXfSM3WlFZg==
X-Received: by 2002:a05:7022:ff45:b0:128:d51a:5157 with SMTP id
 a92af1059eb24-12a96f09443mr4300359c88.33.1774553923052; Thu, 26 Mar 2026
 12:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325063843.1790782-6-kuniyu@google.com> <202603270301.kJulQgkT-lkp@intel.com>
In-Reply-To: <202603270301.kJulQgkT-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 26 Mar 2026 12:38:31 -0700
X-Gm-Features: AQROBzC56kOOvilMQ9x7JfCrqjezesmORZsrlXxqw-kdyJdYRmxiltxnB1IbvvY
Message-ID: <CAAVpQUBdco4wFmdVFdi4yQbH38fDCNLL-SUD=udBUy8uJ0spqQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().
To: kernel test robot <lkp@intel.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, netdev@vger.kernel.org, 
	syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 12:14=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on linus/master v7.0-rc5]
> [cannot apply to next-20260325]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
nbd-Remove-redundant-sock-ops-shutdown-check-in-nbd_get_socket/20260325-175=
457
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/20260325063843.1790782-6-kuniyu%=
40google.com
> patch subject: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and=
 shutdown().
> config: x86_64-buildonly-randconfig-004-20260326 (https://download.01.org=
/0day-ci/archive/20260327/202603270301.kJulQgkT-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260327/202603270301.kJulQgkT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603270301.kJulQgkT-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: inet_shutdown_locked
>    >>> referenced by nbd.c
>    >>>               drivers/block/nbd.o:(nbd_mark_nsock_dead) in archive=
 vmlinux.a
> --
> >> ld.lld: error: undefined symbol: tcp_sendmsg_locked
>    >>> referenced by nbd.c
>    >>>               drivers/block/nbd.o:(__sock_xmit) in archive vmlinux=
.a

ah, CONFIG_INET=3Dn.  Will fix it in v2.

Thanks
