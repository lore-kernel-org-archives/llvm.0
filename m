Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9AF223DE5;
	Sat, 19 Sep 2026 00:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778875; cv=none; b=P4DvwfLHgNGs3O0kIJsE0+ofHkmtF391HK5zCOzmo8eBUMiOH5fXtKYDnlEv8jyvTIa9wL5RcDt1yMs/EJFmK3DDQgTopFl/2L/O8PHYFw2H/WC8RJzVLvnV1NIENngXuTxWOV9wQ66G8O10lKBdqP+NU6ozdlupqNx92bPSQF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778875; c=relaxed/simple;
	bh=bS/Unja4dXYbFcYqYbAE9VZpwEJFjC4FTvNPcoUZqxI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E0mUuT9yuX2ZiSBApystphCE0mMkj4tSc3i/9IViHhfn+oL5BF3uuT849yQPvPH08MIcbZ+xnrz4bUqR0EOUHjc1KX0bDSQMkuC59in/szrqtlS7ocyzDu4Cgig32S2HGjstS0yPISNQosO4crRD/vzJLdSr914SQPo7OMBjifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0XxZtnG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0XxZtnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D0D1F000FF;
	Sat, 19 Sep 2026 00:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778859;
	bh=l44u54NGQegQTy4FgW+UoNKtjtKv6PfsWA8pSzp6iso=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=o0XxZtnGZirUvphJUQk9VOn6TR93felVKy6Fvo5I34q4ooUc2lB/CYE7B3zR36L7b
	 uiXZ3sXTUQ2lIOxjSBFXJQUbM5pW8V7EOuEO0Mod5CRpyOM0V2LSsEm32397IBwong
	 s6VDoNpQEeSz/ULMA+nKJeuMFSuN/i5JCz28yVbm5dv49feE87rVlQNbm+ID0ExmpM
	 vk6vLZRcLhj+8/pg16EKHdTlBhWrG2hqgowlZ4rkzFnh5GP/VuWRit5nWDHjhvJ4+l
	 aTHDqiN4VN+uvZJfW99k/0oSKI5n2gTXn1KcYFpFksj3wAmo6IqZlkmLn9NBILSHPH
	 WUSF4lgDNVn0w==
Date: Fri, 18 Sep 2026 18:47:37 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Aleksandar Rikalo <arikalo@gmail.com>, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Conor Dooley <conor.dooley@microchip.com>, Nam Cao <namcao@linutronix.de>, 
    Jia Wang <wangjia@ultrarisc.com>, 
    Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
    Drew Fustini <dfustini@oss.tenstorrent.com>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: limit sifive errata to CONFIG_64BIT
In-Reply-To: <20260916083752.47310-1-arnd@kernel.org>
Message-ID: <3f809812-03d4-92c0-0f96-db76d8d909b0@kernel.org>
References: <20260916083752.47310-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Sep 2026, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are two errata for this vendor, and they both individually depend on
> CONFIG_64BIT already. However, an 32-bit allmodconfig produces this warning
> from clang for a condition that can never be true.
> 
> arch/riscv/errata/sifive/errata.c:29:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>    29 |         if (arch_id != 0x8000000000000007 ||
>       |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
> arch/riscv/errata/sifive/errata.c:42:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>    42 |         if (arch_id != 0x8000000000000007 && arch_id != 0x1)
>       |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Thanks, queued for v7.3-rc.


- Paul

