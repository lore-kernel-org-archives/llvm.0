Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD983016E0
	for <llvm@lists.linux.dev>; Sun,  8 Mar 2026 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772996294; cv=pass; b=lItaBA8NbDSU350bwK0VI+N0wNjCf3F1diSDnulVu+5THBaDzx1mFDwENdyfiFYzy9OMaya20uVlLytJn96YbzjM3Kj93GXzbRrE5tDrXjUBn4kssrD5VPtr4pMVrtm5qDvanma4zTTCUeU6DxD05i4Oba3ePdvzTNo3ZG6iUNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772996294; c=relaxed/simple;
	bh=J+okUNsU4n0XXov13CjFPOR5tCpWRrmV8oBT26GKEfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A375QY7wyiIOKdBrqlb9jfaSHohHvI+FYxQ2YskdYnhbHHoprKbOMyFlnwIfP3Id6Ejj+pNJ9TjUYWyXFpAf0hpG7M6f/9w6KRrImo/Sq9jM7shdrWhpteAQ6b6T/WUKMfSBAPm+eL9q9YnkmJvFtkwHq5ee5Xm40LUf0b0tP0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uW8UD+9O; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uW8UD+9O"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-127380532eeso8433358c88.1
        for <llvm@lists.linux.dev>; Sun, 08 Mar 2026 11:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772996292; cv=none;
        d=google.com; s=arc-20240605;
        b=RVTIZQAjKJkm+0iTMk+iKZAMIXHp68Ni3wzhhrWYQBfB8t6h96NgvKMxBsms+768xY
         nuTOCrHE9kB74NLyyhEIzIkanQZQ23P0E860ga3FdSWyl0o47PXDOr6kC66L5tlZOYPL
         b0offIjY/92/9McR/CcwcoCuFbPyAkeJdwEEHKLzqE7HHmUeYRqF9mex9JIVKwVRWYCF
         tiQOxL3aL/C/r49b7bxseoffaKmv7y5vY9jXu66GnjNYTNUelsxaGRwwx8nsrBxua+Cg
         1uTTkPqM55tr7cGCRdkrlgUHkWYRuYfUJyhpzqrSn3xMXWj1OFFSYyk65bLa8Q+I/eji
         AQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oFOMMYzs+cDnMVZz6rJ8vj6DqKrcVUiqEcJmPl3Msys=;
        fh=0uDdSotp26u7sVwHosOvKiaAKJgiRwSPnbB0PPZDNAI=;
        b=j8HMeWsWIah5CxYnRG3aCehK0wgZ96r9X7SCiOfG1OkhyRFOeKcecCtmgiYVNplRSM
         rZN3TN+aIbctj3Nc4SkUPnbsiMfV3krGm538mmB/sYlmorGke1q5xR8RjWfRWEjW8CTX
         6L6irE9nE8z3ZMfkZBlwin5FinDQnCAzsVs5xmNNAAR8ENovodSEtz5l6+MyQ9xVo8eQ
         ByfzmbVk0jVTJufLdp1+q3EnQYQEq+73/I4RDwWgQPGqGhT0VJ0gK3sQmCStgwUVUh4h
         948NPmPCAAZOmujp6a48dquZDsmcWBNXUCcSV69b9HBZk52vcDrvmBWCwBDFwxPbez9u
         rXbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772996292; x=1773601092; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFOMMYzs+cDnMVZz6rJ8vj6DqKrcVUiqEcJmPl3Msys=;
        b=uW8UD+9OhiSJ7CGUDkQn5ts7ZOrPmthBEOWub4Vj+R/aJj1dKpcezw8771tKlj9ifK
         bE59I1ziRVknqHeSm2XimH13yL0O0iY8IwG3yl+2qRFyd/kRIFVnyOVhsKG+9FRXLr9T
         cR50qwTMwAPh9buWuWF4EhT6ZGYzeWnx7lypYdO4A1WeY45I0siO9MUaOBpSW3Jc2jOI
         +bmJMqlLvXs++Iiv8OcppPZWT94qXkRVQof26SfZfsbN3vpi/Tygdu5Ak4XpRNV6CuZJ
         VPeUCPthCTZleb2Gl4LHHWha/TSrBXHXWkhrX3sMsEN/GaubQJdt1FDbkyDPHXcTFYmN
         RqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772996292; x=1773601092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oFOMMYzs+cDnMVZz6rJ8vj6DqKrcVUiqEcJmPl3Msys=;
        b=iEM4x2EsCPkpqc+SobKA37CXbjM2+YZSc/SJfixFkdE4WMdVQ6gNa+N5l4oP037Xmv
         SACEpul3JMLTHdB6p2QXK6pQ76iRpV+GFLfLE6iX0Q/tMKEf3e9RkDxkMACmPA4a0upd
         6OAzDNBzuum0ieXhTFMprGTfFhMPWn3qNL25rQqHp90WiBVy5UB4SrgZuFO5Wfv/Xsga
         J+fGQKV0qhecAgFm62tNVI+mr+J8VsrmIaxc+EOix5JM5Ap2k5Dz39pbZgETNn2fKI5w
         6xlPUXOuGslgUoA0lSDMCZtRC7GjgJGhp0FSBgCA9t+F/aYTe3vS4NDTMeS+J7guXeez
         vxhw==
X-Forwarded-Encrypted: i=1; AJvYcCUIx96zcnQhZFPa6GFQ1SIiJjr+j3/hRQ/cSVMyOzzemXOcdpjRKRcV+wlm9OuePr+Udfo1@lists.linux.dev
X-Gm-Message-State: AOJu0YxK2Iy/0m6VBf4s5HJE4C5dZlVR9CjGQZvB54FC4ZnBPfAr3lgq
	3wFfyVORvZnwi3wFXK7rsr2T9ZYI8fzXmv0LesViwrqq4G3ydbGwSC0i2gxUOMSj8GNoIFaDA21
	YobPUEeHVBULuQ6q+NK7cHQYW1LPT+haVNmCGukw9
X-Gm-Gg: ATEYQzzUnfy8XEtfO+Qng5QQTHpVdT2i+2kkU+A7ySHchsq7Rp38Qk5H0QyC/HxxonT
	2vsXVqn7Kje0oNC0kzgJXDdoT0imXVb/hTUAABBRPlTv/VfoQNtAGTPTkjDkHtwyHXk5a5fyK+e
	RD7XpoZ7bhNaOTIcEv20cgsJUByE/TjnsYq3W1ghl6YoOrD1klFu2Yu/dw/DOR0OP78Vw+Fa/4l
	gWQXBSICbTtos014ck+vhgt10hovEmoVcocZbyhsZhLZJZgrths3Mq5YrsmAAe9boB2emMZWFKj
	QirIK8zhQNgrcY4GVY7xtIhSlIm7XJjSFjvBuEEcalQlNjEFdLu5DoAnPAICjdaBWISHxIE+
X-Received: by 2002:a05:7022:6714:b0:122:153:d161 with SMTP id
 a92af1059eb24-128c2dff0b4mr4373551c88.17.1772996291360; Sun, 08 Mar 2026
 11:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308032304.1841198-3-kuniyu@google.com> <202603082250.0lR88YW6-lkp@intel.com>
In-Reply-To: <202603082250.0lR88YW6-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 8 Mar 2026 11:58:00 -0700
X-Gm-Features: AaiRm50gvdwjwEaFZ30chmoDyx4QO3rQoJKA6k3uOdzy-9ih5FaZdPvPg0Wecpk
Message-ID: <CAAVpQUC3q-m_RR4qvkN_tNt6CKA-8tmQttMaxVy+HjQpXf==hQ@mail.gmail.com>
Subject: Re: [PATCH v2 net 2/2] ipv6: Don't remove permanent routes with
 exceptions from tb6_gc_hlist.
To: kernel test robot <lkp@intel.com>
Cc: David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Kui-Feng Lee <thinker.li@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:50=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
ipv6-Remove-permanent-routes-from-tb6_gc_hlist-when-all-exceptions-expire/2=
0260308-113030
> base:   net/main
> patch link:    https://lore.kernel.org/r/20260308032304.1841198-3-kuniyu%=
40google.com
> patch subject: [PATCH v2 net 2/2] ipv6: Don't remove permanent routes wit=
h exceptions from tb6_gc_hlist.
> config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/202=
60308/202603082250.0lR88YW6-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c=
32caeec8158d634bb71ab8911a6031248b9fc47)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260308/202603082250.0lR88YW6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603082250.0lR88YW6-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> net/ipv6/addrconf.c:1282:5: error: call to undeclared function 'fib6_a=
dd_gc_list'; ISO C99 and later do not support implicit function declaration=
s [-Wimplicit-function-declaration]
>     1282 |                                 fib6_add_gc_list(f6i);

Ugh, apparently I should've used IS_ENABLE()...
Will fix it.

Sorry for noise !
