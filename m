Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133281D0F4D
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 20:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937927; cv=none; b=N53oJYYBt5qtOCbfc5UiFS45EmZKrzzYkWBlPlgpJkz5WMYNB4RnxwkkIo8a2GHvJG866XzLXxVF+G0ZnjCuNfZ6J9Gn7iFzLGCQc+HFyS9ah1lBaF7TjLxR8Pq3hNfjwZzttIqwq6NHghcLXT6l6LB8dI2Ttxa0Sf8Onb/uTVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937927; c=relaxed/simple;
	bh=TMxLqduIw6kA1ss36IhCl4VL1rlLiuHaiMfW3ij+fks=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WuejBMmhUZNMVMRxt9fW4SMoGpaHFo3GnLtT09M4A8xZqnfTXtMbAnjxH8fDJKVom8CxT3gFypIFk+Z80lyvJnXYIKJrORmyNDaCvGDt0ICLDPFmeNks+2+LjhH0ZLxbVUk089y9UVp/flZYZZ9X71hpBfxlGXt2qarCjha142g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hk4Jq43e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hk4Jq43e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728937924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A+XFi8p5Wa4vRFJDFaQ7fuuwB9lpUcOqyAfiWpRSFTU=;
	b=hk4Jq43ecyOaICGYcIv7Lr7VP0/y9i0dyzwnk6QM+uAUuPbZXhsQSJSZ7EealZSlOw7BaB
	OOf1JSf90e/EpoCl1AUETZF7v8bugVE0qvG9Mb188CO9cTdrCz7p9kKQ0a2wTBCUV6frlg
	jhsmo/SCZwhsm1T7tHCmupxCWU023XY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-IgzEHuiDNUGwvZSQ4OZcNw-1; Mon,
 14 Oct 2024 16:32:03 -0400
X-MC-Unique: IgzEHuiDNUGwvZSQ4OZcNw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7D7919560A3
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 20:32:02 +0000 (UTC)
Received: from [172.64.5.20] (unknown [10.30.32.29])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92999300019D;
	Mon, 14 Oct 2024 20:32:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, eca631b8)
Date: Mon, 14 Oct 2024 20:32:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <48612.124101416320400133@us-mta-187.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'f2fs-6.12-rc4' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/jaegeuk/f2fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1495666868

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1495666868-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1495666868-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1495666868-x86_64-kernel-debug


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

