Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3592F999F
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227378; cv=pass; b=Zc1i7KvGfrRExf3CAmsD4X1MwRV9VXSEP5wtEoWJeet31io7cI1mwoq8iEwkoEh+If4tes0y6mwSsyeEJap0WA7QQJob4oZ7BnSsSExCty6DYs9PL4tRqy/L6QOUYTLXa4DL+0z9VZP+yn3meTqaTqYZbdjy5Nn7JL+iu8sHQVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227378; c=relaxed/simple;
	bh=G7HK52tHCK3S/WidEejsVHPNzDjtD9ztNr/RbDRczws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKNQLkU2BpMIqWFfXCFhhh6KP4LWKUwxFjsq8WGiNveyNEEY3zkqjdT1jDRyu04wN+7Tn9ureMB+fdBjvVV0euD2qcx6Z3KsCbFD91eZZ54S5C6/aUhiSJrMk+/vUXckzVjHgHviCPypdGRSYHe1NX6EpP6BK9oNt7QUHzIhlxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cP7mTjZW; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cP7mTjZW"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b703e04984so633272eec.3
        for <llvm@lists.linux.dev>; Wed, 04 Feb 2026 09:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770227377; cv=none;
        d=google.com; s=arc-20240605;
        b=kRympg8S/5kv4V9bsM2O5TYG05phcpZzZ6JpUBfpZxYthrHejGCGIXlhzl//H3FInp
         tybM76HbJYimPuwTzBVFKX0BpELzGicuJh8FYhKGRjLSV7zqVNPdHDNpzzLjEhLjqIhW
         iHCePPAzcVJamVyUzmjMQRgAK1QTUsAenHpJlQ1u3uxhEWyD7o/cQPnq/8dfr42H442N
         /TU6T+NU+kdk5n+vZGERU+wU/FQccyZ4ICPAPDiDR5wWeYaCl2VUHkYB5K7hJFdn1RKi
         tGkMbhiQWnr8VaLI+Mx46OGM5sP9U476Xg4QFVc1dx7CPDCY78pujqlRVtGWBJjYJ+HP
         jIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xDefLCRgV/TQ3JHNjcWIRVQ67vN0JwqCI2ji4ZmQrkk=;
        fh=ELyEfNSKpBwNWOEWqtxdbEXUjrxx00QBDAviJY3vPDc=;
        b=aUPWcg+Dx6/7/JM0wODu3TUAsNnu88yCGK1ALOJDccwSO1PF2L6XqKlE3ZlJkMEghb
         qLoPxHqHNsrP0o80KRBbWc4W7l7Bc72AoJvxsNZDDmpI7YsUTbsxAFwDvRoMQpok9y18
         XA/xXCrJe5mZSIsnKVJrleZC6BqJV0I9JXGvp9qMwCCnnibacS82vP7YRai+gLF9puTK
         t4W66SGLcsbkMWx7WLciJC0ro8OhkkZJ8K7JjC7sT2L2oNC3d3BY/GFiZO8u8Ep+S3Ku
         fainO9j30dugAIx6kl22W/V9d0Y7Xff+uFr1JahjEq/nPlpK8UG59m6AcBBPT7T57bWe
         NcYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227377; x=1770832177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDefLCRgV/TQ3JHNjcWIRVQ67vN0JwqCI2ji4ZmQrkk=;
        b=cP7mTjZWcpGS8F34dCEQOT0/kqkWE07DAX8qB1Tdik7SriTJE/8Y1RyRery1/GMC3I
         xD/XrCjZSwH2AZmRfeDiN2BUZHZFFXqX9jLTMbJ9xykuUpPrTPecYgmXpbSZfVROB920
         QF4d6MIzwbJsnemLmK7hSImoJ+Hj0OU4fqvYHAVt7VgcdYUObOfGb7BbvrZrMOVhLPRa
         XPd2Ak0PP7jPqGrZ6MRsi8uTogexD2tKSEdrdHNXAZ6ofV5upooamQ8sCt/8KC/A2Axu
         ttBncU7PAqM/eRKAEFswaKv0DZUCEXNQBZ4hFeaQDDjUyaVLRk3+FKeTQ3zi6xT1jQbK
         XisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227377; x=1770832177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xDefLCRgV/TQ3JHNjcWIRVQ67vN0JwqCI2ji4ZmQrkk=;
        b=nX2Vpfqa+YOU6MQmhOREtsrCncMaFSCsvrLFpiEEwaHbM5c4oLnspUMlUrLcsaHsUP
         hKLmCBw+LuIejG/Up2EwBrQwzJBTsw9+m8OTxBUjhzpjSXzoRfa4FDVtx6bV5QhNGbBQ
         pydgSsG8EF0prNrCBE2YHTmLJR2K1pOeMrPqp5bgPC62JRhdwKq6n9o8Rcdg2He9yjtU
         EHmoblYYKT4IEL6EsNdmyr7+Ig8hxY258b+GUbFtUa9nuXs25Uhn9w3/eRajxcDsb2QE
         oVPh40zENrD1MT3ooRWRMbDQ+Nt/pbW/tue+yuww//VyjrZWUU3btgbxfAv4n8+RC4Lb
         U/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1V/mOLA1MnYP8idIS3p+aysGRvSOZ9uttOSxaL/cLxVM+c1aoywmWQjz7MLikwSN1lXan@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcq3CAFVEFXN1dNNuwDw+vsvXvYG+uyRGLdw9Gm9zKg0LH5Kyf
	aQQbkU+mp2RQzF32mriyqUVUBcXXRERbdwXJP4QhoMeNqNWYa0pLFpIgW4LnFcL6j8AMOm4vMfU
	HcvaJKDlIfnwwcy6Xe40u8ZcsLovkLsrO92HW
X-Gm-Gg: AZuq6aLdHpkIvTqrGwcYi3srLxJGzMvRoxpNqlO/00dUode1zVHHIx91wJgetnfu2T9
	lSCC8uRiGCO7Y11HKUicPhSk5vhqwssM08A/+mOnr4H0sEfP5Qp4mi040gXOuaLvGN5XZphoTec
	4kyaNVmIuS9/a5pr2YO0PbvOykC+gZOWeD1gqsm2+lWLdcbFc2oa27Fs+3wAF631WIClSUnBkae
	shqCaFvEjXCzGnUBOKlZxSc+SW5lwfgB78M0dEljq2pLBLrA9ViKbT6kD/5gM8ITH3mLpgiXy3n
	th6lN2b/J1WgkfnUq4Klmp4vf9gMsloZVLyWybiwCeHW1I/EkwO8FH6LSTkJLwJJaPoF9f4hGz3
	KmmOTbG0ssa9f
X-Received: by 2002:a05:7301:4592:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b8329d7929mr884867eec.7.1770227377226; Wed, 04 Feb 2026
 09:49:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204042417.83903-1-mkchauras@gmail.com>
In-Reply-To: <20260204042417.83903-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 18:49:23 +0100
X-Gm-Features: AZwV_QhpXt59DsIzTmuh2ZPPW6T9uONYBCxBt7FVK2mswJ22l7u_sEZEOBg8s4M
Message-ID: <CANiq72k41tCq7-LccTz2NNpUF-0sOqPvbj-z+Qz0msud3O-3AQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 6:54=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> +    } else if cfg.has("PPC64") {

Can this be done via flags, i.e. avoiding the `target.json`?

We are trying to avoid adding new custom targets, since the idea is to
remove our reliance on `target.json`.

If it is not possible to do it via flags only, then we should talk to
upstream to add the needed flags or perhaps a new built-in target.

Thanks!

(By the way, Michael back in 2021 did the original integration of
ppc64le before Rust was merged into mainline -- he may want to take a
look at this :) I see he is in Cc).

Cheers,
Miguel
