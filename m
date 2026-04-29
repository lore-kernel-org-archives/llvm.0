Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43415383C67
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478594; cv=none; b=sG9GkG7ajDQn2ublVGzd9esBcEwPosK8q2LoYRFJV/2h9vBKWXF3+wBnkJ032c8RXd8pNJk24uNMYzafu3kN2t7DljjdGuwoiFFrBFOMmrO0yf61FlFjpZmLOP6I9+81A1IrRV4mz3OwbxPZMnff3VCco9tZadVyZLBjDKrx6yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478594; c=relaxed/simple;
	bh=ASowbmPasczMP5dbxKPT/+SP8WynqK8x6CIcQuy1lJg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=D8JPsWUa7vtOddujdLbwFLQMSkgfjc6zxiExBiIKVdRfTGsH26qNcv8vv11qkaR3tDLoXwkJXiq0nTqQxWvbmik654GLGYbGPFbokBAAy2uQteeOxrpGN7NPMy9DxOr/Tj6BZ7SZebgT/g3eigg7eg+H5EqylTXg2uS05Cx+7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K4+9cNDR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K4+9cNDR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba7fd666666so1236954266b.3
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777478592; x=1778083392; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhdj0vDqY4IK9FGeHJnEdg/Na6gGbjvcG8OkOW45Cug=;
        b=K4+9cNDRV4RczyDwOPqacAaHmtAUywQzMtt3DMUC6ybNdfNBtmiwDQ/myDSOMEmPWi
         wsGSeR2JSyi9KSwvIO6wJi5C1Z7wrAiGIGF1qfEklE6CThDwP4KmzAUrYMn1M/WDbh5u
         Ln/mO6nXjvFyDBhelkfy1TEeGjz0Is8L+U4OfABVpu+mS1QlH1tDmgXz2eJutzi+CFZI
         CcRQnVe0INNn8aC87wLOKXgu570mBxZiZHEc4938sJzeZbCddowxSthMjB/Fs/jFxP/0
         gFVeZTjnPXJaza7rcFR5IGkYU62mMO47RfppEdvC//jD+LjnXr0LGUHWSPQ9gaQCzf7J
         aEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777478592; x=1778083392;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhdj0vDqY4IK9FGeHJnEdg/Na6gGbjvcG8OkOW45Cug=;
        b=F5Aj6C06zKbWaZggbjUJ050rgD0DtvXFQ+4Ln3rqgRp2dSJ6Q6So9GILJms/s8QZgY
         eZZsWKeufMDxzsEdBIMHYNO0nW9wd8Rn8iHw0/q08DQakOvZa9zqOvshQIZ/2HEA5q50
         L/Qh1JzH7UhrA1BzUe/spSdwxYyhzhTlDzFRYwm1RwRWw/6dHHVY6lfK77B/b0NztHCv
         SaJXwqzZABLpjr7K9q4cwUMcfUO4KdoAPEySkYzEzMxk/an1QzeanvhKePhcPEAVVFuv
         Ud+vF51RAgHBfOY41VGMVJX8qQkx4xnWqaP4hDB/qZwScShMhF+29JAx3yM1j6jdv5LF
         KXJA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ij4gUAvbIxIop0Aogi0ZIpFxBTt2mZt3uQw98UCARxFJlvbq41Qq+IJcyzGIJAHuPXFwb@lists.linux.dev
X-Gm-Message-State: AOJu0YzFmBsKKSTKyPNXHS8DAcS+wkcwWUrVD92Krq+t9M9Q/rwr2cqb
	d2y0YjBpTY7HUOMJq4biFc2OzllML1ZJBACbNg2lhczHqIZkFKKKkTf0GYgjJmUPn8M=
X-Gm-Gg: AeBDietPhHhcLzh9v7Eo3+ooLNxCyXLz0RwV/yv0XC6+Qc9m14IfvTyNL+MjJIW2cg7
	nuk2AYzG2CKh/9SVAVOCoCSXgDE8Y7Iu/silQt4tNEdE2PqB7K78AsRIMrcDj3RmGR0fEcn4KzM
	CPOrMizjIIIG5y1EqE4BEG3pCTgTwM41kbZNHv5vzhgyCMtu0S/C9bMzgGzyTwLtF+xQ7aDbDqt
	eNKFmemEjRSISs2u+yIsd5A+WkVq7C5eOm/kJF52L9/yxt7w87JoxmoJLQ5VTl2DjAPgCdGEW/8
	7agxVkAq+0Mbvrmsh6FK6YYmDn/phSyVKRHRiM7pEqndr5AgU2XsZZdYrhtRJoE3PzPUmPUh281
	OW90tIOTY4/5Os2opydmnMJ7v0RPSVuMGo2AQ1rDtL5JHsvVGGkf+GnkD3eH2sCat7Lk+YpJvcq
	TliZ/ACG+NAG5iCmEVgHD5KuE=
X-Received: by 2002:a17:907:199a:b0:bae:7a8d:2b89 with SMTP id a640c23a62f3a-bb8028bd7b2mr466986266b.17.1777478589871;
        Wed, 29 Apr 2026 09:03:09 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62982136587sm1265170137.2.2026.04.29.09.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 13:03:05 -0300
Message-Id: <DI5RKLL97L0C.12X4X9HNJNDCY@suse.com>
Subject: Re: [PATCH bpf-next v9 03/11] selftests/bpf: Tolerate BPF and
 skeleton generation failures
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <alan.maguire@oracle.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
To: <bot+bpf-ci@kernel.org>, <rbm@suse.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260429-selftests-bpf_misconfig-v9-3-c311f06b4791@suse.com>
 <0625d99bd069ff39efd2a3077ff84b7b0e7be5c2c3129bfbb4f7fc955a6aaae4@mail.kernel.org>
In-Reply-To: <0625d99bd069ff39efd2a3077ff84b7b0e7be5c2c3129bfbb4f7fc955a6aaae4@mail.kernel.org>

On Wed Apr 29, 2026 at 12:13 PM -03, bot+bpf-ci wrote:
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index cc6ee7a2df93..b104c687dcf0 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>
> [ ... ]
>
>> @@ -607,47 +611,81 @@ $(TRUNNER_BPF_OBJS): $(TRUNNER_OUTPUT)/%.bpf.o:			=
	\
>>  					  $$($$<-$2-CFLAGS),$(TRUNNER_BINARY))
>>
>>  $(TRUNNER_BPF_SKELS): %.skel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
>> -	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
>> -	$(Q)$$(BPFTOOL) gen object $$(<:.o=3D.linked1.o) $$<
>> -	$(Q)$$(BPFTOOL) gen object $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked1.o)
>> -	$(Q)$$(BPFTOOL) gen object $$(<:.o=3D.linked3.o) $$(<:.o=3D.linked2.o)
>> -	$(Q)diff $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked3.o)
>> -	$(Q)$$(BPFTOOL) gen skeleton $$(<:.o=3D.linked3.o) name $$(notdir $$(<=
:.bpf.o=3D)) > $$@
>> -	$(Q)$$(BPFTOOL) gen subskeleton $$(<:.o=3D.linked3.o) name $$(notdir $=
$(<:.bpf.o=3D)) > $$(@:.skel.h=3D.subskel.h)
>> -	$(Q)rm -f $$(<:.o=3D.linked1.o) $$(<:.o=3D.linked2.o) $$(<:.o=3D.linke=
d3.o)
>> +	$(Q)$(if $(PERMISSIVE),if [ ! -f $$< ]; then			\
>> +		$$(RM) $$@ $$(@:.skel.h=3D.subskel.h);			\
>> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
>> +		exit 0;							\
>> +	fi;)								\
>> +	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' =
1>&2; \
>> +	$$(BPFTOOL) gen object $$(<:.o=3D.linked1.o) $$< &&		\
>> +	$$(BPFTOOL) gen object $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked1.o) && =
\
>> +	$$(BPFTOOL) gen object $$(<:.o=3D.linked3.o) $$(<:.o=3D.linked2.o) && =
\
>> +	diff $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked3.o) &&		\
>> +	$$(BPFTOOL) gen skeleton $$(<:.o=3D.linked3.o) name $$(notdir $$(<:.bp=
f.o=3D)) > $$@ && \
>> +	$$(BPFTOOL) gen subskeleton $$(<:.o=3D.linked3.o) name $$(notdir $$(<:=
.bpf.o=3D)) > $$(@:.skel.h=3D.subskel.h) $(if $(PERMISSIVE),|| { \
>> +		$$(RM) $$@ $$(@:.skel.h=3D.subskel.h); \
>> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
>> +	}) && \
>> +	rm -f $$(<:.o=3D.linked1.o) $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked3.o=
)
>
> Does the permissive mode error handler only apply to the final command?
>
> The TRUNNER_BPF_SKELS rule chains six commands together with &&:
>
>     $(BPFTOOL) gen object $(<:.o=3D.linked1.o) $< &&
>     $(BPFTOOL) gen object $(<:.o=3D.linked2.o) $(<:.o=3D.linked1.o) &&
>     $(BPFTOOL) gen object $(<:.o=3D.linked3.o) $(<:.o=3D.linked2.o) &&
>     diff $(<:.o=3D.linked2.o) $(<:.o=3D.linked3.o) &&
>     $(BPFTOOL) gen skeleton ... > $@ &&
>     $(BPFTOOL) gen subskeleton ... > $(@:.skel.h=3D.subskel.h) || { ... }
>
> If any of the first five commands fail, the && chain breaks and the
> recipe exits immediately with an error status, causing Make to abort the
> build. The error handler (|| { $(RM) ...; printf 'SKIP-SKEL' ...; })
> only catches failures from the final gen subskeleton command.

This is false. POSIX shell && and || have equal precedence and are
left-associative [1].

A failure of any command in the && chain causes the chain's exit status to
be non-zero, which the || handler then catches. Make recipes are invoked as
/bin/sh -c 'recipe' without -e, so the chain doesn't abort early.

Example:
  $ false && echo B && echo C || echo HANDLER
  HANDLER
  $ echo A && false && echo C || echo HANDLER
  A
  HANDLER
  $ echo A && echo B && false || echo HANDLER
  A
  B
  HANDLER

[1]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.h=
tml#tag_18_09_03

Thanks,

>
> This appears to contradict the commit message, which states the intent is
> to "continue with remaining tests" when generation fails. The same patter=
n
> affects TRUNNER_BPF_LSKELS, TRUNNER_BPF_LSKELS_SIGNED, and
> TRUNNER_BPF_SKELS_LINKED.
>
> To fully implement permissive mode, would it make sense to attach the
> error handler to the entire pipeline by wrapping the command sequence in
> a subshell?
>
>     ( cmd1 && cmd2 && ... ) || { error_handler }
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/251156=
89001

