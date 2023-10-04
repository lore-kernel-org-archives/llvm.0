Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D410F8
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 03:36:34 +0000 (UTC)
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <riel@shelob.surriel.com>)
	id 1qnsWq-0005AO-0x;
	Tue, 03 Oct 2023 23:26:28 -0400
Message-ID: <456b5f3d2a7be32a9b332dd175a6b1a54118bdc1.camel@surriel.com>
Subject: Re: [syzbot] [mm?] WARNING in copy_hugetlb_page_range
From: Rik van Riel <riel@surriel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>, syzbot
	 <syzbot+ec78016e3d67860eec28@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,  llvm@lists.linux.dev, muchun.song@linux.dev,
 nathan@kernel.org,  ndesaulniers@google.com,
 syzkaller-bugs@googlegroups.com, trix@redhat.com
Date: Tue, 03 Oct 2023 23:26:28 -0400
In-Reply-To: <20231003172928.GC314430@monkey>
References: <0000000000005f05820606a0838a@google.com>
	 <0000000000003179510606d327e5@google.com> <20231003172928.GC314430@monkey>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Sender: riel@surriel.com

On Tue, 2023-10-03 at 10:29 -0700, Mike Kravetz wrote:
> Adding Rik as this was a result of the conversion to invalidate_lock
> patch.

I fixed this one in the version I'm about to send out.

--=20
All Rights Reversed.
