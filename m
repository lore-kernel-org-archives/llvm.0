Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CBD32693F
	for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113952; cv=none; b=kPdHbSBen/3I7opu6LSFDiUTCt+zPUo0JUhMZO6Yj4RVwJbSAAomQUL2NaICZA3bLKyNq7EzKAH4bgUxS94e75THbvwFgp25lQ0Dr1No+n6Phhgeb2FnmlcIRvA4GuBB3t1gemPLqpBrVgQp3m9U2lMi29FNoE98hszD32ghZxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113952; c=relaxed/simple;
	bh=dDbdKs/reOX/Ro2QQ4y9yDKHfgrv3HPQ+5tuYEjKOfs=;
	h=From:Message-ID:Date:MIME-Version:To:Cc:References:Subject:
	 In-Reply-To:Content-Type; b=t/6mjBxd3vjf8YXg9jwDhO5pdticuicotNyDTQfc1uemaHSk5n3pebbfqHGKgAukQpw+/g54rzUljfimFzGYOxV2HfW8bzXZNpjuUZsHS0BGvoRf3771R0GyDtldJnEtIPv5pjFKR5tqYvw6DKhRrYpa6BQbMnsIHQ+aNsH6tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHXIJdMf; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHXIJdMf"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso6998221d50.0
        for <llvm@lists.linux.dev>; Tue, 30 Dec 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767113949; x=1767718749; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=NHXIJdMfA/gPmci9HEh9+MhU4p3fyjH3KUxH69TNhqTCAd+3AkgJvQUNeYqy+8PQLi
         WSlgtN+Xb7HE6nPyQQJMCnxSgAfVQQvZZrLISoT38Tfugo6wq5abMCnGq0An1ESLBYu2
         vrPUFJYWJkhLqQBS0HezVWdb33/rsUPY4SvnY6Rv1d4wgqclByh3eA1usVRanH9JNV3R
         FFYoJLM1EQC11z1HCiuL0X8W/R0qK2C18FPdPLRWSRMhd0mHpZQ6aEaWIci2RRgVAQt2
         BVy+S0ky61aE4kXxYpdbbrZNxvyOxXNqEWCz6EV/6f4EGqLrB2leIsRvSqJp6X3Hxo93
         tNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767113949; x=1767718749;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=mKNC27NBPeq7TajpiitRUmMH8gi9QLmvBpMTZY1MpF0cHS0WKeJH1ctji3pxcSJbkX
         FR0EKEJ7bBwJV7w4q3R8+7N0ae0iGCHZ7RnuUhXlPx3KF4hurJpsRT3KzWsA3X2OStjO
         YHkaGUiOYkqh7afxChXnusEJk2TBuUTDpibdfwlNkkdsBgpP5jZZCLQs38aif23SesuG
         DUvupfRL39LWe7qvNzfBl9YOmNtoKNAvjttMsC1F7AKPboRNJ6Zjr5f52ZNlXwWmO7xn
         HEmOQ1iwokp8FrE+WwgzZSSzPceKxx4yL+Hai1NyZTlTv3rcKBhspS2gtxH/dzVrNeO+
         S8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcxXpjIh5JVtsvggtsuJKxbJubJ7j9nmv+fqpqA96LjyV7mjcubjZP3iejQOjivEEUrGP@lists.linux.dev
X-Gm-Message-State: AOJu0YwPB3QcjVfUpWthUG3U+awOjLOMKyci8TyNgKDz/9RBc5uhCFfN
	MYGKh18A866WzkiZq+IMrm3xbybd+THcZLxUQhZkYGjeLhYAjP+Ko+1U
X-Gm-Gg: AY/fxX77ykiPI1JXvpzAH2vw/E/YBQD6pUz5ulBpbxK5CNYGQRAgLv77Pjxueg40CIP
	MpVy5Ros60YDfP39rwL3NxDNz9eWAUFELT5lS6Gv9KAjRVRpcwH1VGgWHOhEJwIO60WkVOsmjsY
	1jmUMkRsV0oD94L5ZtS7ntT8EfPGCKalNQYX0tpWtk6EKoDInbL1c1vC/5UB75BArVw5DASbjOt
	GpI7ihY4bHcXUGQ5n/eLZscWvblLUlHanDcI5Uo1VY2NIVCUZ+Zhlnw9GpwcNh8ErNIVHmlY+/h
	XBn5zdpa25mTXIQoXjlgZKlbRTdXVO6qEEa8hNCS7x8UFh3DJmvtBOvSXp0m/sBDwtGNAVVAMlJ
	sGtx1Q1FfBwuS2GTTKXYPrAnEyRH9Xk2ytrnd48jiuXm/05SvNi2PhurocGmWP1V+OV0iBRaFDI
	MYYZlWFpeFDgmyVkEq4JdI1mHfJLU27/IeUTZ8yqc1
X-Google-Smtp-Source: AGHT+IH2V57ZyrIGYmhMfY0baEpBO+dBiOAau3e5WvXJCMGvc5QlBIWU/5RRYx65BeBxQ6CEQap2dA==
X-Received: by 2002:a05:690e:12c9:b0:636:149a:f54e with SMTP id 956f58d0204a3-6466a8a5c84mr29092072d50.37.1767113948961;
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
Received: from [192.168.1.209] (74.211.98.217.16clouds.com. [74.211.98.217])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92d913sm16230434d50.20.2025.12.30.08.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <f462b3e9-0650-4d5f-ad60-96e8f1e39419@gmail.com>
Date: Wed, 31 Dec 2025 00:58:59 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xinrui.riscv@isrc.iscas.ac.cn
Cc: a.hindborg@kernel.org, alex@ghiti.fr, aliceryhl@google.com,
 aou@eecs.berkeley.edu, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 conor@kernel.org, corbet@lwn.net, dakr@kernel.org, gary@garyguo.net,
 jeffbai@aosc.io, jmontleo@redhat.com, justinstitt@google.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, lossin@kernel.org, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nsc@kernel.org,
 ojeda@kernel.org, palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, wangruikang@iscas.ac.cn
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Content-Language: en-US
In-Reply-To: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am replying using my previous personal email address to cross-verify 
that <xinrui.riscv@isrc.iscas.ac.cn> is indeed my own.
