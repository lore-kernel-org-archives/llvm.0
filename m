Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904128EA5A
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310531; cv=none; b=btzQy86nruFUtc1kkswQlxldbpjpjn/Xm3IcQ4a03C1/Ftwd+SSKdljXYVY0rT/4qVCfJzumAVElH8S6i62mW54ig7x15jDKCIPWiFEs7Qb1VH8rRA1dRxKsymFQGR4XyjlJ6r8Kfy+Q7jyDu8iAb4ariTQvFXUbflk2Xw/GP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310531; c=relaxed/simple;
	bh=C67f2LvzCMDsY50DHmd91h/ndX0vCV9CAFbI6ak9lE8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XNiOoXpxx6SntK15SqXiYkgVcvmiz1Se/h5sMxD7NtyX5u7gtxgY7cNOgyE/kUqcL9epKMTloGRshv+Wr+TMBORlIUqd3my8tLsdjax1tUwltj2IdYAvUMJI9qjA075svFhXaIf2+GSYf5F/jh1b9zLOglj4gZeejH6t2ZRM3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+ohFbPQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+ohFbPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744310528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RiXe3FTZDLhVQqOvIWCBXnW8Kbg69HfT+sE/lY1F0dM=;
	b=R+ohFbPQ/Ak7+TzvVUKIpbRxJQBnz47jenW6eIGPuDL/ilhJmCHNkz/qeDkS2EcYwgnIq7
	6AIY5X+fwtgIAuskj7J3jgzpSTMDJNjKsiYRJn2NDgVczLE2CrLUUBaRIaOwmVagJGUbJm
	7/syAOnbinSeInDi0uuCnefUZaL95ZM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-D69-n2TxN9qGVSwNyK80xg-1; Thu,
 10 Apr 2025 14:42:06 -0400
X-MC-Unique: D69-n2TxN9qGVSwNyK80xg-1
X-Mimecast-MFC-AGG-ID: D69-n2TxN9qGVSwNyK80xg_1744310526
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 254F51956048
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 18:42:06 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B9720180175B;
	Thu, 10 Apr 2025 18:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, ab59a860)
Date: Thu, 10 Apr 2025 18:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <37978.125041014420700103@us-mta-81.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dIUJ-i525-OTZ9Xc9YQlzqDYftlop_8KYkZwiE5cFzo_1744310526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.15-rc2' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1762887384

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1762887384-x86_64-kernel-debug


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

