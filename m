Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3181FB0
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 35079179;
	Tue, 14 Jun 2022 17:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 35079179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1655227823; bh=9ylsUPL7VbCdDnr3J7AuARBJq2lzJrjWzQq70E6IeUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PijtgX5xJfyI5RKvQtLc6cCWx4yh5eJ9ahWhS/N7syHhPAIZoSKAsJGH59m7JXFAz
	 OdHIX1ywy21YB07pPZs9KTng8GTg24uCu19NdEQw2MWReKWqXOfLQYGWKeKPneN2CN
	 n5odCHgVVWN16gehJ8ndHnFg1PoJZWSPEjRkx4cQ=
Date: Wed, 15 Jun 2022 03:30:23 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: kernel test robot <lkp@intel.com>
cc: Micah Morton <mortonm@chromium.org>, linux-security-module@vger.kernel.org, 
    llvm@lists.linux.dev, kbuild-all@lists.01.org, keescook@chromium.org, 
    serge@hallyn.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] security: Add LSM hook to setgroups() syscall
In-Reply-To: <202206141619.gvenMkdS-lkp@intel.com>
Message-ID: <ddcc855c-d8f-98ff-24c5-3abe24c1fe@namei.org>
References: <20220613202807.447694-1-mortonm@chromium.org> <202206141619.gvenMkdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jun 2022, kernel test robot wrote:

> Hi Micah,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on jmorris-security/next-testing kees/for-next/pstore v5.19-rc2 next-20220614]

My next-testing is out of date, I'll push a newer version.

-- 
James Morris
<jmorris@namei.org>

