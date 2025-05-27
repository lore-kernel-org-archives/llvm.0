Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87E20C005
	for <llvm@lists.linux.dev>; Tue, 27 May 2025 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379188; cv=none; b=QIdeaA/94sJ02j5camLIprXAWCWGnjch2Wq53qGHLUgS0ytfrzU+KlwDenls2tnYky7LBgh0KxYQSB1LwbDvd8SvDLvsCS5WaUHMmcG7EDWGkU2v8/BekdW+akioEAE7uETQiOTcIsiGVH0/kXmrUzbS547xdoJGyvGGy/Gx+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379188; c=relaxed/simple;
	bh=3JaG1dlS2lbMSJ9RZBNf5ZlKT60h7P3c0JTibmcAIG4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=gKPpYkpngpHaBYzU7F0TxTMvODQPNAp5VuZput8ieQQ3TOuj7hkaLGCw+SPiV7bfmM5V1Q/0P721B2vFHNl2D+HpJUdfIcwZdjTD7thkfje9ElvN2eB81WmsAtXwgp+O9xWqUJQzyK7S1IQ06FZJ9Zk71sGskR2eKR9hZnJTonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q5Ik6gSb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q5Ik6gSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748379185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ulKfXOMSNSWSb5oDWs/aCYvwCveIf6cyzFGoZJ8KQcU=;
	b=Q5Ik6gSbrdwdZcr0+KMZJcSmSSi2HZ7HCTzzZ2sd/6Iuktxhy35iW/R0MMKudFwaSCQUMZ
	Kvx3rVUZs9xMGkBEg0L9s0IyiOqcJkJXi5zCOu7KeTHggd97qqK8divUQvT2FYRUMg6uDU
	2+xfi3xn+CGW3H8w69vIYlrXKN/77wE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-hicqbQR2PcuRMnmIx4TVKg-1; Tue,
 27 May 2025 16:53:03 -0400
X-MC-Unique: hicqbQR2PcuRMnmIx4TVKg-1
X-Mimecast-MFC-AGG-ID: hicqbQR2PcuRMnmIx4TVKg_1748379182
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C016B18002A5
	for <llvm@lists.linux.dev>; Tue, 27 May 2025 20:53:02 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 73F3618003FC;
	Tue, 27 May 2025 20:53:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, 015a99fa)
Date: Tue, 27 May 2025 20:53:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <79984.125052716530302429@us-mta-624.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AhUuLyR3hL059F5u2c_EKdiiA5iQHAhYtjMHltebGrA_1748379182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nolibc-20250526-for-6.16-1' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1839515949

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1839515949-x86_64-kernel-debug


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

