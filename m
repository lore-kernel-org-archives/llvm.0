Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28783A4E;
	Wed, 26 Oct 2022 01:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEE5C433B5;
	Wed, 26 Oct 2022 01:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1666748660;
	bh=bHpyYZDXAx8mBAobHYaUgm9MJcFrGUXI+Eme7rkyIvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xiOCxn5+2haxn01ENddqXLTAyu0UqJVQNgmnl3b2U4CxDBHRmZo5pjDS5JS3nG9JN
	 4i/YTNLo8xStTH4/mvlO2/pibkfAEDk1i6Zy55HRi81yPaERCldyer/2RoOBa0YYYq
	 gCAlIpHAiQ5idudT8eVJFNQV6xfx+wPrPta2R718=
Date: Tue, 25 Oct 2022 18:44:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Gautam Menghani <gautammenghani201@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 3067/3190] mm/khugepaged.c:1729:7: warning:
 variable 'index' is used uninitialized whenever 'if' condition is true
Message-Id: <20221025184419.72d7dbaabb21f161d1a41bea@linux-foundation.org>
In-Reply-To: <202210251946.eT92YAhG-lkp@intel.com>
References: <202210251946.eT92YAhG-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Oct 2022 19:01:57 +0800 kernel test robot <lkp@intel.com> wrote:

> >> mm/khugepaged.c:1729:7: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

Yes, thanks, dropped.
