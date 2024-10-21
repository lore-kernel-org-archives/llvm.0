Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4994E1FBC9F
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729537988; cv=none; b=PZxQ1N6nPl6nEYyLyHJ4XrdCK8fJB6/q13iRsUxk1WUmnjzzv7HDRS2WX81ca6Cn5RV17e7onmSL1jEvr05wLTEw1891z/i6s9zVohJqYOeWgTU1qQwOaENbSNVR3N9xccraSfF6kRVVp2DYQppWVlwmrol9y2B/qf9n94HE+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729537988; c=relaxed/simple;
	bh=qEzkf2hm7Db0ZIYOo/oUAEmVcFYhYN2P44rivNSGft4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sRk1oFrpmok3mH2d1xTNwDLPtNaj4byhTYYX6U5VmPuj9/zGUnVdMWEoATX/cZtjFKAcrPTRFDhEFcAGJfjORoe1mBPJif1VExQX1T8+FHiBx7/cZDpbCJDsuiiJ7nl9gw87V9ZFg+QO/dAYYLOk/SRPKLhYOFvfIcwh4UfRqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dOwfzIlx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dOwfzIlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729537985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v1cU54W2zZjsKoMCSUvwn6TxjGN4zQasBsXynNpxNbU=;
	b=dOwfzIlxWcK/wlg/A3eRdYp+y650Hoy7658YJoQmj2zuG9NAGWRbh9zW2vn24bDo4wty5b
	vTFTHG9mRkvxaNohpM9kifNJjDELnM15GMyfAho/l35o/CXMLwgoCbXBPCYYrMTvdde37B
	5zZlPHSpVYaO/S3GkEZBRcJVacsnPyk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-PR0WqfqHPHKUIkVUYlBrjQ-1; Mon,
 21 Oct 2024 15:13:03 -0400
X-MC-Unique: PR0WqfqHPHKUIkVUYlBrjQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBA3D195608B
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 19:13:02 +0000 (UTC)
Received: from [172.64.10.18] (unknown [10.30.34.11])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7BA07195605F;
	Mon, 21 Oct 2024 19:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc4,
 mainline.kernel.org-clang, d1293776)
Date: Mon, 21 Oct 2024 19:13:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <43411.124102115130303010@us-mta-641.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1505927994

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1505927994-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1505927994-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1505927994-x86_64-kernel-debug


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

