Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF3C2F4A
	for <llvm@lists.linux.dev>; Thu, 22 May 2025 02:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747882387; cv=none; b=FuoYv49Jl27LJPJSgzxNvD+7I0deyT0mgjnOMLntdo+589qzIEEmBaBQ5Bag9FmarR6+Viz9NOLgkJVCQ+c+iSj7yNJd4WD8ZY0loIhJf0xnJz687gNCNliyjd/6edm/a45haqtkQQQUP8aKt7RsBQL/fcDXnZECZRB2txcwx1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747882387; c=relaxed/simple;
	bh=3mzJRFNDJauigQ61tnVJaI+EOr1wHPUIN9X+YCIg6IM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=I3E082B8DVPGrJYRrvLcKeqvt33rfZ/OyC75a+cRQw6nVKEeYWDeONCZby7l9BgS2UYpnzJ9kpn17sMOfR7+y2/M+weJIe7gs544URKrsAZ/v3FIMqJkH3PeO5HOJ1KEctXUpRFWVJC7O+NWxYoGeYXEImcYVASK+q9fqNo3qVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QpPrUUxz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QpPrUUxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747882384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ciAZN1ZjYAYqq19cmHzEbucYfbalXKXO7J128cqNFVg=;
	b=QpPrUUxzJQBBejCVqwL347soDrvH45E3zuzAZJjY8iEGUV+7Gzk4P0C9vOaJxxNHt86j2b
	wHI8dw3PP8M0/kAxLViZNNOgUpN+FjOcjcJtZVc1x5OsSYA4ng4Ndc9pGCSzDXW1qiJZbN
	fOszPuqRZvObCn44y86ys5b77UYs13A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-DGJXCZ-yMX-anpe2hE08Dw-1; Wed,
 21 May 2025 22:53:02 -0400
X-MC-Unique: DGJXCZ-yMX-anpe2hE08Dw-1
X-Mimecast-MFC-AGG-ID: DGJXCZ-yMX-anpe2hE08Dw_1747882382
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E04B3180034E
	for <llvm@lists.linux.dev>; Thu, 22 May 2025 02:53:01 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7586F19560AB;
	Thu, 22 May 2025 02:53:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc7,
 upstream-mainline, d608703f)
Date: Thu, 22 May 2025 02:53:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <63548.125052122530200126@us-mta-529.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CDll3UofOz55EihOckdfRcS7347Z2KHB7yFbNXCJV7Y_1747882382
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'clk-fixes-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1830295311

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1830295311-x86_64-kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

