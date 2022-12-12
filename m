Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27061854;
	Mon, 12 Dec 2022 01:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5TKg/eKOHSSglLF4faH0Eru24SwOHfMbXW57TNYDstk=; b=nmhY7ZqI75gEHuxNloTkcwhqZ8
	v5j/Gz1xiU++O39m/fF9XLZUN9CmWEbwf8FSP7YDLax4pAdnIueacCjsYPcZRo7GWmO5HfzilYNVJ
	Pk+VItICaAOhGSzcPFvLwH2qEMMjmFs1NE1VgUHeB3vboPrffDl8RRZwRncBb8A+Q7m9XZKm58+z5
	jamOH0+WVqarB8XcTS9+HkwHTCpkOhis4yozrT4AyUGkYWgka6RGZw6xNlCidkBHjSn9ukEzhQlNA
	KS8ExLXLWcbvxgez4gIAUOkcMq5fmKqnTLJhXMlpGkkfMfi2jIJWjtKbPAR4rzYg8ObC6/ao/VxOu
	+RNBq5Xg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1p4XI3-00B8PQ-14;
	Mon, 12 Dec 2022 01:07:31 +0000
Date: Mon, 12 Dec 2022 01:07:31 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Evgeniy Dushistov <dushistov@mail.ru>,
	Ira Weiny <ira.weiny@intel.com>, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] fs/ufs: Replace kmap() with kmap_local_page()
Message-ID: <Y5Z+05hRftbI0mxk@ZenIV>
References: <20221211213111.30085-4-fmdefrancesco@gmail.com>
 <202212120803.iPhHqCqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212120803.iPhHqCqR-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Dec 12, 2022 at 08:52:47AM +0800, kernel test robot wrote:

> >> fs/ufs/dir.c:210:22: warning: variable 'kaddr' is uninitialized when used here [-Wuninitialized]
>            ufs_put_page(*page, kaddr);
>                                ^~~~~
>    fs/ufs/dir.c:196:13: note: initialize the variable 'kaddr' to silence this warning
>            char *kaddr;
>                       ^
>                        = NULL
>    1 warning generated.

Warning is right, suggestion - worse than useless...
