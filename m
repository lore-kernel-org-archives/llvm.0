Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A11D3955E0
	for <llvm@lists.linux.dev>; Fri, 15 May 2026 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847311; cv=none; b=CKChZadG3BLZ4kAybI7Wl+xHwkmHCgWZDLOhnPNAhZ9pJtQvA8R6ktZ+P0jUPXXz0dvvwWEO9XFO8NQ68YIsbd3rPyGMHrX592G9YET83wg6BxSTqpmraMIuVGoQ46+dhXl21zUMPltYK8vhpbdrTGCacAv4BAOtWqzWVmWs+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847311; c=relaxed/simple;
	bh=nghT9y6ENngQFDLkYT8F2cg45VlQPtMjBBkDABwEj3E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ILjppDu9BzzdnjVZCFsD0VBUR6U2dQWOVrz0Gl10YGECkZEQ3S1mMjwju6G7Uoa5+SCW62F0mA6KrIcT7YrdI2tBDaphoAHzgl5L7b/XrpWFeY2/PAGs0mBEhM/818T2fH5koWus1Tql5ogByODc5dAH94IHlPprSMQEydgU4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HChw1s6g; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HChw1s6g"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso79564735e9.2
        for <llvm@lists.linux.dev>; Fri, 15 May 2026 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778847307; x=1779452107; darn=lists.linux.dev;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nghT9y6ENngQFDLkYT8F2cg45VlQPtMjBBkDABwEj3E=;
        b=HChw1s6gwSSHW0RGtUcr9/f3aByTJR3LLcb7EDfGd1+UYdyWPXiUBwbW1cjT9wp2U4
         56Hdadxecd71rTJY7rNujL2k+R6HjxI8zVeFOB1GqB+UQ+M3jUC9M2+1Ec90G0+h7yVN
         gbPFgT4AkKJvl9dUiiSrYcUZJ3A8QqZ5ukC6Ui4fBph6pLmpXb83YFEMhZ8CxLibs+Gf
         6WyUxaIi8EeYJspMd1+sjW53blgILtFWcGLRqs/N7gnZ5BROPYI4XH8jAnW9U1Qvdmb0
         Q8feHTmhdY0ggQe9O3Q3MmOkNzC6ywiq9kjYLk/AVm3BQUDRjTq0UgxuhtnMLwXDVZ17
         5pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847307; x=1779452107;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nghT9y6ENngQFDLkYT8F2cg45VlQPtMjBBkDABwEj3E=;
        b=AYRPPLOdsV5NavEFxDXqK72rA6QsOsvbpow5uDAwKM5+HdAgMJS5w/4tCQH162QfFV
         LmFU2Zkd8eHc+b9yd/6JoAGlGMw4xgih64w8PDY+mAuRAeAuQbDvdCVBTrl/yfPNmOea
         w4GQxaCYfSJPTCmm8Ai0j6duktfEpXBB6bduiX2XIPq51UOu0L43inKG0FwIKARbKFMM
         0J+hBsf78Xnmk0IZD16uSklRlDhzjKb6D3gjUI0m778uC3Sl2a7jJDZUpUZuxm7SkSUK
         G543rg8MvukAK53zkAt9T0DiG9mgzVwEcMi2CQ9MaEaC7a2PI6KiYD8LDqEfyz+XzPNn
         y/xA==
X-Forwarded-Encrypted: i=1; AFNElJ92Jzq6WcCKlqQmE5IVo8yPaa0H0r180XUc1rfZO98CJqhd2jYm3CanM3g7VdxopYlnirN0@lists.linux.dev
X-Gm-Message-State: AOJu0YxYH5HbSzDdyBi9zmEGrr+IXMUvh/nSccdX2lMeVPGq4L4yTeDd
	S67l/yt1UtiUyFTfr0oa/iN2e8dk0Kj/MQNo6oC71MGYdToPAPwBL9bI6dEpvYAawlQ=
X-Gm-Gg: Acq92OFuCsCiGjPKvfHH1LEwfRokZU3dxsWCZpsTH2iEm8AMW1j4TKO5/EPzHXxk+NB
	ONT/XZ28Hco5i/RC9amh0eAvrtQjuPV5RiFTcl2QNCE//igIsRnXBT5DnvWG/jRoeYsFQMdutpy
	GhTCuxBrsHY6ozF5drhDWWdccpYDqyIF1xvYORM0EVShG9u9y8Ku9ed404oaySw0RzMibqkbooa
	Jb6YKmBI/6cifBuvH2iXz5sk9oSrud/GiKHzerrh5ZvF47k9/H7QA8IwTpqhJFuJggF2p5Hm4eF
	8z2csEIv31B0UAscESl626+VRXWM2k5B5qxOzJcID46NEl9TK2DeACKOZYVtT+PCVCk6t7kWOT4
	SB74Cf0BooqTUBzx4Pkm0YdvfbzC1LY0VtNYE1QMJuOEYua4zOBUrWFu7eZ/sFec32ebWw/ykk2
	3bcTKxBwYV9zxZK289ECdmA5r/qgtsBwq3
X-Received: by 2002:a05:600c:8b6e:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48fe61ed21amr56127295e9.20.1778847307241;
        Fri, 15 May 2026 05:15:07 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:1285:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351d9sm9796573c88.9.2026.05.15.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 May 2026 09:15:03 -0300
Message-Id: <DIJ8QPTPH61Q.6NT4DT90K5F9@suse.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
To: "Alexei Starovoitov" <ast@kernel.org>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next v11 00/11] selftests/bpf: Tolerate partial
 builds across kernel configs
X-Mailer: aerc 0.21.0-146-g87073a0460e3
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>

Hi Alexei,

Just a gentle ping, please let me know if there's anything else that could
be done in order to move this one forward. I believe everything has been
addressed.

Thanks!
