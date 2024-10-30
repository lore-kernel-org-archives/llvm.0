Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB42141DB
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730305595; cv=none; b=pH4Xd0vaKxBFLMERGh9JW6dNiIdjDK4ddNRZbssMgyDQXu/rR6S5fn3O2Z71pxjJnAOKpCdZOEaacbz8iAF4UKcss5gm2tcU9c5Hry7TnhXgr+MT9j0QIgZltghPzXfiKy/FKUEnQzx6iL18Arj102J/4MqtW4qkU537/MZfE0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730305595; c=relaxed/simple;
	bh=7BkJTqkjKokIlGCgi8x1LN9fZqNdMWvwk4aa5kdkGdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEe7fPspu0e3yvn9+sJQ6LVwvdw1LSCw++KuXqZ8uy++VwbK8mOWRzVleE81yzn7NNBH6a0wSeJbQ926eyAMXrDc4Sqd635nNW8IL/ToGaMztgRvAdMbkFqCkwQBeLNqcuMkGuG6QhF1ua1bAeDwKKCEFVJWu7Cj6a8UBZQUtmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff5Jkaoo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff5Jkaoo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588D6C4CECE;
	Wed, 30 Oct 2024 16:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730305594;
	bh=7BkJTqkjKokIlGCgi8x1LN9fZqNdMWvwk4aa5kdkGdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ff5JkaoozsvTlHqGSfncvRXd3YApXYZ0aiwfcsiR4kws58zZSzkHxxQ62J4Iz+ZcG
	 Yw7nCQ2Wyz2cptdU3a/ag/Hh2UwVv5ASosFqJgZE91TXTc2PEsJnWPzKd6UZdzmD3A
	 tX+i1fn1p1ZMQeJQhQmiDAtc74HkirxrhX3Phe2QPohxuTgu7/P23rEy/R/qkraYv1
	 YxY+P7Bp7He6POsiquoIeiZ4A4g7wxfDB7D56cd+eMRaLL2ICmwaXDVN1o/Ujx8IPC
	 BtFn3VNnOVMP6ORL+OuHnfYxF90i6snCmI9FP7SiJBdddiNAHV9RDJG9XA0g40miuZ
	 jHEC30QD+k+iw==
Date: Wed, 30 Oct 2024 09:26:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-20-init-10266-g71315698c91d: Failure on
 aarch64
Message-ID: <20241030162632.GB2228266@thelio-3990X>
References: <272034616.43155.1730268368701@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <272034616.43155.1730268368701@jenkins.jenkins>

On Wed, Oct 30, 2024 at 06:06:06AM +0000, ci_notify@linaro.org wrote:
> In CI config tcwg_kernel/llvm-master-aarch64-stable-allyesconfig after:
> 
>   | commit llvmorg-20-init-10266-g71315698c91d
>   | Author: serge-sans-paille <sguelton@mozilla.com>
>   | Date:   Mon Oct 28 20:40:52 2024 +0000
>   | 
>   |     [clang] Warn about memset/memcpy to NonTriviallyCopyable types (#111434)
>   |     
>   |     This implements a warning that's similar to what GCC does in that
>   |     context: both memcpy and memset require their first and second operand
>   |     to be trivially copyable, let's warn if that's not the case.

Thanks for the report, this should be fixed in tip of tree now:

https://github.com/llvm/llvm-project/commit/dc56a86b96d77a93f761995d50f7b2f112856311

Cheers,
Nathan
