Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361D2E2F0D
	for <llvm@lists.linux.dev>; Mon, 13 Oct 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351443; cv=none; b=uzbKl/pNyll7XzanuNIel2Fxvmqz8RNRoF/6TW4vIm0jPaCysUGL2M3RNj6ZefrpgcS3owQ/h+R/jPdBoCBpph8AByxVCoVxvimz6pZhSFO0nUO/TO67ITSDuQ3+DAZ4XSzki9oGyDtBvoVpCrxKzaArIXYFeHqILslIX2dBBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351443; c=relaxed/simple;
	bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXraWyhSUc/XGpubWhd7Z6ZI4BS/LiPaJFnHFN5PXqmpu1T8M8ReldL3YDXsjoRmJjkK8XXsJX/QktKGXrc5pVOycsAWXH1SogvA1A6OpYB/dIJ0/XNjYTmu8FTfbTVx7A0vHULTzieM5sHkvqbS0qntyZ0qwoCBHdrBn5UiJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4wQ13Kr; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4wQ13Kr"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso284405a12.0
        for <llvm@lists.linux.dev>; Mon, 13 Oct 2025 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760351441; x=1760956241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
        b=L4wQ13KriDSZ7H3BYwh//OkNlx3kIXhDEHqScAjDHM2uGPIFiY9zh4xVBY1SIjX5+w
         hluzzk9FBV4+bH365qadQvCUxUMcMHyI2MFd6aJORRCI8gTdq99B3DYsFfvqDGy7MXT0
         5T6WwFmNIWSKTERCWjyjBJGNoWPe6y7qR6PwafIOPR/2snIzxFl/bkSdc5iTUbKl1GhV
         osjvmw8naq6ylsBfEtkmZePX8hCMfa7S/lONY62E2Vv/qj44Y6QBg+B0U3r+4/19QIbt
         KRPzvF4u6pPWDEVxMwoFbOwBRBSfD/DfRngtumGO9LkJSryMwMPg1LLrMELbzumR77lY
         nE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351441; x=1760956241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiFRFs/pzEd9dRu7mmnIj+h3VvAGP09WSi9bmQ+XQXE=;
        b=B9fWFSSo62W+vZOfpk9ymaXjy/nYPoJ7R+NSSTD2NUki+lQPOUGLd4oYyrdgng6cd5
         ikB8EnWmkgDIdcHkvXSCpED1feexh2lhmrV3Xu0TeAe311np4HKd9vTgPBpISaNrpaG6
         e30N7Ws+B4IshUNnFRxvBBEE5V6O+tUz321thPGiuRyyXol40mTujsMBl/FQHxbXZ3aC
         Y6Zgs079A3EREqgFOTNm3SAD2PqukyOCgrr8hx7ZEQWe2vtPGFqU03qd5L0UD0fymo0l
         sDs4y91hlHDMz3rTXDQZYfiMEFdH33r34oR+17hn1/lwOIt9tgJMAhG8UZii9bizBXGV
         Zldg==
X-Forwarded-Encrypted: i=1; AJvYcCVN2u4J0NVM27X5TTghcL2Ti4ifCBqFQMnQtm/onS0OVcQ2o64vR+riC2da1OUfU0hMQymN@lists.linux.dev
X-Gm-Message-State: AOJu0YxWSPacidc6jDaseIrUe34aDliLOe9WKXysh5KP6DfuJa81stXU
	3UZ9w9GzzM2wRpq0feDq4zFX1Js5w+ggg5WLqLadhac09FiPvzulxisU
X-Gm-Gg: ASbGncua9zPQHy2/jog6hJpUZsY0Fkk2VRLnY2xUPDAe4EmRJwwdjPtTgJXs+U2sbaI
	ktNGU1TDe7h0d68kOdi1qH2mI7WBiLTb9B2A4F7IWYPT2N6Lu4ooF5V9+/iD5rmXwKTByZuXtic
	5ACu2A22oxCm6WxJohkyGidLoESTvjGHOLx5UCjXqy6zF3azr3jEoURg1DDRyawFvcXPPwktD//
	MYKdnWoM0+K/RO9IybsnmFuc7Vqwz5cjSGXyxOU/4vfe3N3QY8KUvvQdPhOlQbFunYSGMIisCK3
	HN90f5MwlzHkzisuH8hdi2afEtp+dMep212TdcVZhzIb9ADQc1ntF+gmlKkVG7uIJ+IGy7kT91K
	LA6dGIUaTSXHesofi6ct/IKmNC4GJrM0+zgHcRQ==
X-Google-Smtp-Source: AGHT+IGzKbSk+xpeuhcRPxXprhrHKgWgl+TgyFJOpJO1QcWS3vLYIUxy1cm46/h9evTFKRIrqkRaaw==
X-Received: by 2002:a05:6a20:9383:b0:2b0:ff55:f838 with SMTP id adf61e73a8af0-32da83782b4mr14502989637.3.1760351441359;
        Mon, 13 Oct 2025 03:30:41 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d284bsm11467729a91.18.2025.10.13.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:30:40 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	benx.guo@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	si.yanteng@linux.dev,
	tmgross@umich.edu
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
Date: Mon, 13 Oct 2025 10:30:31 +0000
Message-ID: <20251013103037.44979-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
References: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Oct 2025 11:45:39 +0200 Alice Ryhl <aliceryhl@google.com> wrote:
>When posting a new version, you should start a new thread.

>Alice

Thanks, Alice, for the reminder.
I’ll post v3 as a new thread.

Thanks,
Ben Guo
