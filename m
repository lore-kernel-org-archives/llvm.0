Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295804AA8
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 17:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49F7C340F4;
	Tue,  8 Mar 2022 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646761998;
	bh=qQ1IfZm1nAcpdIyRWU7BdrNKZacU5ouB40x5DtnLP6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJLIktdPxyfYCo6l/52ECC3cCKSIaBxIE+ehICq1BJir3dtPxXcYOhgmKMMaewZcp
	 hK2n/GMaXK7GTImfE51ZzVnodt+C3ZE2veRFpkxxXkwKOqLqLMwDDlePqj731uktGH
	 IQHFSOJhnboo1OcHg2h3DfL771HtqjCKQ7kHT1R3YjtU5mmVCaB8eOJ/uopKMcdVK8
	 4fKLGUjw6yneE9fHnW3N72CkS2OyT5Veqvxvc6WIvmUW1r9tSFjQdouKLQIk19r/DC
	 +vwMsyTTT6yb+Qwopze6UPxyJGa9uryJJuT4tTCmF7ipRdjh6sRhotB3mEYxkdOcHq
	 25/Nsks5RvVpA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nRe1H-0000OC-TD; Tue, 08 Mar 2022 18:53:12 +0100
Date: Tue, 8 Mar 2022 18:53:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] USB: serial: usb_wwan: remove redundant assignment to
 variable i
Message-ID: <YieYB+D2aAGB7FHV@hovoldconsulting.com>
References: <20220307183100.150082-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307183100.150082-1-colin.i.king@gmail.com>

On Mon, Mar 07, 2022 at 06:31:00PM +0000, Colin Ian King wrote:
> Variable i is being assigned a value that is never read, it is being
> re-assigned two statements later in a for-loop. The assignment is
> redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/usb/serial/usb_wwan.c:151:2: warning: Value stored to 'i'
> is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thanks.

Johan
