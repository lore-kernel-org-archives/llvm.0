Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965128;
	b=W6r0oC7Gc6T3Gwty2fYuVdfRDDC6iF1xTGpJMAhmVBBc1NKGgptFUlRaEEsp8ck6Yn22
	 IMyyVwZzttzEJcscnQkMv/L3fuEq/O6kRSndkvOBgsQi6wBDtFUBu6OaopljmeUNqgnqZ
	 4TNidgcgzoxM21VS/m79pN+edJoVhCladJms8JwXD/0v8F4Nkm+GS7KRvuW/6P6Jv1Fy9
	 UxKfGW19s6nAqzHMyPJA0vIN09cGmKR1Jbaqtv6EwNRDKIdUCRAby93t5KYYTyvsAUBHE
	 1Avg5bINDMnTYe4/DCrWQrk9s7c2KuqtCiMB1mD/OtuiffJOg1sDKXuAztOCDbjzYNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965128;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=/jfLHbBsiNk6pHzafuB3Dsviz9dVAGhH/4U+1XXEIc0=;
	b=wSsf4gR0SAMqZg7LN1hTNcYQfTBGQLDoemD2u5X0Pez7UJoex8mSGN3MaQhPDRKK66hk
	 BBoDenyOV0s0RSckCqKULk22GvYlHlyDF95K9HjMJXUfCvJg04u0ZtAwggHCVU2PgJq8V
	 DVidAwpKsQv8QWCzEG8XSL4qD431d2RjqsuUatB1loNRUJKIFlwabo7/+jw/E1HteaDX/
	 c5jtXmHtvuo+SGW+CvnKd33CRDAM5NdLdPUGfC5W3LV8OuiRNwYUsHF7e15Sr7wSRg4Uy
	 +wjDOWCrDjzLNgZuJLgsy5ClyND0qyliL5NBtxlMUkecUo56SuT/tMZ8tz2iC83mKZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD96606A339
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 11:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD96606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67bf27f179aso548379d50.0
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 03:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965126; x=1794569926;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jfLHbBsiNk6pHzafuB3Dsviz9dVAGhH/4U+1XXEIc0=;
        b=LRJomvvZh1SLBXty5j6vJprmWecV2KJd5umllC+RUWaxmzhruJodBynn1TKqilYgSY
         hg97FH/Zkp+e4i2Ak94M83gbfNgyRAmC6oknLTSdghdWrTryEu07r+a2SAlLkojDvWrl
         b1TA93x9fhFysyG7zn8GvprWW2E6Pnyg7sag5hO33gRmdxL3uvzGwiWeCnpvS50rV22c
         bXCkT+M4JKiYLjAwM46cBeiIly9XI5hpXfJ2pedhH5yUPYp+9kDtVwH+O5hPvgFvtsdt
         fYl7kfU6k5Ysi+9z8bIxuheLX0jVV3VdMVNkDo+ozaR66K/LiwQHFEneSgRzLp5qJywO
         H7gQ==
X-Forwarded-Encrypted: i=1; AL+hErEZLvg5t6hPihseR6ecYjhIVy8qRD4jQgrGCSnu1cNzwbYnobQ+DurP19ceoxnUm1XO2eX4@lists.linux.dev
X-Gm-Message-State: APuU4Z+mujTzfFKuJVyADV9KSreINVTyaCvg6bxLG5Ju+Dc1VJLPwE1J
	4UrGHmqAKm7+jSOwqSI/f6Ew1GxwcZJOEGa/F6We/We5g2Z/1BJGChlg
X-Gm-Gg: AYBFou2jYu/77oHnbXQoEtjwoWX+qyCkcLiRBb8fJF4YgYTo6EbOSxgLjDW11Q+YSSU
	9N8+Ic9oqKWdXiE08efxrMtce368LzqLQtrtF5V82+YJlCL+JS1C/1W2CrxdVBXXMSRZO227tlJ
	HSwkCmR8lHFIw2BzgfGgJ7mBefQodkuuH9rT542kjIhzkNZAwYoKuupqE+mZ276ODmn5jhCjpdT
	J1oI0LQn+LFcmw5Pwdw63hWBQMUwdX1/XmJlLbGy+tc0cj7ZqsTtVSBjWDAqI3Q6U+CLQPCiSh/
	J3D/UXzrGf1whBVrD09xKQZJk44hJDzWl9foobggHeJWVL/BURLTLm3ACyaTcB0GGDHeUUVYJRu
	t4og5JcPeXsd0ijAaQnIj7bYM4DbBC3oTLVquJLDBeImsf3UD11hrF2+d2IFzGySOqnUlWUDUiB
	9v9ZNJnLSlZ3Ii5Mfj9ov//PLuIjG2kOk+bzRm8bsTGKMj/W9YlI66Dm8uY7/fdZ9FjTOaiYOo+
	xePmvVdYNVjVCB/LAlinbk8Gp1VZP3+CDgB4sBQJGcqFuGViE0TGnFJeWtSVhPRiLDBI2fbhc2D
	4Y64I8RZxvNMOOWjrACo8kYqFeUWA9dJQvuoM33+
X-Received: by 2002:a05:690e:b8e:b0:67c:1da0:6bd8 with SMTP id 956f58d0204a3-67c1da07981mr297045d50.68.1793965126563;
        Fri, 06 Nov 2026 03:38:46 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:5e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8221absm16709167b3.27.2026.11.06.03.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:38:45 -0800 (PST)
Date: Fri, 6 Nov 2026 03:38:44 -0800
From: Breno Leitao <leitao@debian.org>
To: kuniyu@google.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Cc: ast@kernel.org, yonghong.song@linux.dev, bpf@vger.kernel.org, 
	kuba@kernel.org, tj@kernel.org
Subject: [BUG] bpf: tcp: bpf_tcp_ops_set_rcvlowat() missing from BTF with
 clang KCSAN
Message-ID: <au27Y9m78_3EH2v1@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

My arm64 KCSAN builds of linux-next fail since next-20261015, because
bpf_tcp_ops_set_rcvlowat() is missing from the vmlinux BTF:

  WARN: resolve_btfids: no BTF func for kfunc bpf_tcp_ops_set_rcvlowat in bpf_tcp_ops_set_rcvlowat_kfunc_set
  WARN: resolve_btfids: unresolved symbol bpf_tcp_ops_set_rcvlowat
  Failed to generate BTF for vmlinux
  Try to disable CONFIG_DEBUG_INFO_BTF
  make[4]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1

This is clang 22.1.3 and pahole 1.31 (current pahole master behaves the
same), with CONFIG_KCSAN=y, CONFIG_DEBUG_INFO_BTF=y and CONFIG_WERROR=y.
v7.4-rc1 is affected as well. With pahole 1.31, the same config without
KCSAN builds fine.

The kfunc came with 5f549c1e49f3 ("bpf: tcp: Add kfunc to adjust
sk->sk_rcvlowat."), and 201a454df948 ("resolve_btfids: Fix the
--fatal_warnings exit status") made the missing BTF fatal with
CONFIG_WERROR. Without CONFIG_WERROR the kernel builds, but bpf_tcp_ops
is never registered:

  initcall __bpf_tcp_ops_init+0x0/0x70 returned -22 after 302 usecs

This seems similar to pahole behaviour sched_ext hit with a bool
argument, discussed in [2] and worked around in f2f095c87603
("sched_ext: Work around pahole 1.32 dropping
scx_bpf_task_set_lazy_resched() from BTF").

Here the argument is an int that clang reassigns, its location list has
no DW_OP_entry_value, and pahole 1.31 drops it as well, so staying on
pahole 1.31 does not help.

Not reassigning the parameter is a workaround for me, with any pahole: clang
then describes @rcvlowat in w1 from the entry, the kfunc is back in BTF,
and __bpf_tcp_ops_init() returns 0 (tested in virtme):

diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
index 2ba73dd6c52cce..1afa6bd7f508ef 100644
--- a/net/ipv4/bpf_tcp_ops.c
+++ b/net/ipv4/bpf_tcp_ops.c
@@ -370,10 +370,9 @@ __bpf_kfunc int bpf_tcp_ops_set_rcvlowat(struct sock *sk, int rcvlowat,
 	if (moff == offsetof(struct bpf_tcp_ops, dequeue_rcvq))
 		wakeup = true;

-	if (rcvlowat < 0)
-		rcvlowat = INT_MAX;
-
-	return __tcp_set_rcvlowat(sk, rcvlowat, wakeup);
+	/* Reassigning @rcvlowat can make pahole drop this kfunc from BTF. */
+	return __tcp_set_rcvlowat(sk, rcvlowat < 0 ? INT_MAX : rcvlowat,
+				  wakeup);
 }

 __bpf_kfunc_end_defs();

Would this be acceptable?

[1] https://lore.kernel.org/all/DLRKT5MG6W2P.2V1P0QD4GQEKY@gmail.com/
[2] https://lore.kernel.org/all/7c139810be5ffc9764ed4236efc28794@kernel.org/
