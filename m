Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639500;
	b=4kPaW1slA8eHAvmra6+0/MIZLSyJLhKYXeHLQ0yVUrmxE2dYbS12NgCYYzf0mtuvRnZB
	 p7q8sXROPodrRqUlgNoYpFeE4qz7d57XWlv2x7ipdsrsQ7sNdXuNI4cR8Nt9nQs1TC2Xi
	 NlO0ZfDWNcDp0m/juMuzWyRVAxETJgxJ5ORL3U+Eyj4O4764ARiU+cemEFmPevSn/H5ih
	 C8o1vMJ34HN8ZRAzjh49/bzJ009dIOG7bbkbiS97PnqSVK1D0ZI4scVauZ0AeYWpX78XK
	 +RDAGMQ4FoEaso2BgAWYK51KPxqkGC/oNvngrfUvdiSYLocqiBHSHenUNdeGjVokS8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639500;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vue2jOZ1khdcISxHu/EhJAQ6nZxM803LHVIcey8TaJw=;
	b=qJmkwKCP8JQiOwfuIH9xLFiyWhPgXw8ojp2Esc2zrHo0r00gCi4mK9wL2fvP2UHjEE/J
	 qh02aR2oOJ/Y6VJkLvslPeZJYJtStFFj/k5EeBtoTGqBeHj2ls9sVFxoaev1AIsiChw/b
	 5/Vp53bo5rsztpgBt2e9HGfVzAcfaYrW5jAJGVqNomF69Vh/RO88r7X9HnfZHryHphCGo
	 659Lzl/5qLN2jUt1U46DTR5SEfQAWulDx7CbcpA5SOH88nBjn9/NOy+BeG4TvXrfN2mrl
	 Vm/K6uNahgMfvVxcoqMLJVEXU7jYYWV2pcycgiz+CmwodwP3wdd4p3bOzNLHxFVRUdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYrZDzw1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF79606A31E;
	Wed, 25 Nov 2026 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYrZDzw1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1378C1F000C4;
	Wed, 25 Nov 2026 20:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795639500;
	bh=Vue2jOZ1khdcISxHu/EhJAQ6nZxM803LHVIcey8TaJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gYrZDzw1Svtl+8sgjl/5MB/bZPKRYGIMwLvJqrXPnugEnMpS6IXVW7+dzSyrvpQPO
	 v/Z9C1MP5cUpVKkUyskgLguAbOQgjv59VTajMNrZhuzG/Xl3i0S+dom7fbXp9IUCoc
	 D6Ndq0/F/WFVZ4JfQKt1DATQuimFZvqDRZrwUJ/f9VMUUu8Ll09nYuVEny+arLXqiX
	 2CrXIKHXfciXgbIKRkrw6gFoRz2Cv86tnyjKNRBlPypARNcrxW9uq5bNRM/pTuH2YG
	 MQcihpy0KgjOClaEfOCn0tSuNcfqWHLLBpw0FxpfGwGT9+U2scEgnh1De+70ab+wFP
	 vUdm1DhIgCEjg==
Date: Wed, 25 Nov 2026 13:44:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Jeevitha Palanisamy <jeevitha@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Usama Arif <usama.arif@linux.dev>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] powerpc: Add support for 128-bit cmpxchg
Message-ID: <20261125204453.GC3625068@ax162>
References: <20261125174035.1412724-1-nysal@linux.ibm.com>
 <20261125174035.1412724-2-nysal@linux.ibm.com>
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
In-Reply-To: <20261125174035.1412724-2-nysal@linux.ibm.com>

On Wed, Nov 25, 2026 at 11:10:22PM +0530, Nysal Jan K.A. wrote:
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c3b6cd655606..79cda056dfc4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -15,6 +15,9 @@ config CC_HAS_PCREL
>  	# do pcrel yet.
>  	def_bool PPC64 && CC_IS_GCC && $(cc-option, -mcpu=power10 -mpcrel)
>  
> +config CC_HAS_PTI_MODE_VAR_ATTR
> +	def_bool $(success,echo 'void foo(void) { unsigned __int128 u128 __attribute__((__mode__(PTI))); }' | $(CC) -x c - -c -o /dev/null)

Please use '$(CC) $(CLANG_FLAGS)' so that this works if clang adds
support for this, which will depend on the target information in
CLANG_FLAGS.

Also, consider following the recently added guidance to
scripts/Kconfig.toolchain and add some information about when this check
can go away:

  https://git.kernel.org/kbuild/c/c285fe817a92f9c747931134f468d2aefeae6bce

It would probably be something like

  # gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106895 - first fixed in 17.0.0, backported in 16.2.0, 15.4.0, and 14.5.0
  # clang: not supported - <bug link like Nick requested>

-- 
Cheers,
Nathan
