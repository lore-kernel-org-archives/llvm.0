Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288B1DFD1
	for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729461130; cv=none; b=ejHniSbDDYyYzZE3PKg7Dm/YMHmb64hbITVjaDUqKoH27ym/4wW5+A9JeUTgLmr4Uusduj427U5760LGeCM2LUAJpsY+V164hLkq/ltLPXsb6Vbz5DuSQ2ZnQ22/C+PaCfMerPd1+2qXuZPIZ6MJJuA5nljnFmMgUj5RE2l8qjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729461130; c=relaxed/simple;
	bh=GiL6vtneKbjrnKaz+ZmquyEw6IRxH5c8RkAJ2ZTJpZY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lXBX+Z5UHUhN+NXTP8wji6kRAjZg02Bw3vxzuNTTSBkleUYviqhcN4D+In1J9Ovx5wya8f4+a5aM+4HyOFFDRBOtcSTs+Si/2TNdhIsJICm3aYnVuxIFpUaI4CBanDvYym8Oe34ps5grHmQJTsZ+8fJU+cbFMkYZkM75WI2Qtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a7wew3Nx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a7wew3Nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729461126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SMyChWsK+kcah3vtHDLBUV/zrhZ6swfWFzvwXIYOu2w=;
	b=a7wew3NxfDy3VbagRzfk4DHdl3Lsc5ukpaKOhIc6z+aNHIcTcyd/+QAosyBxMzwcd17Qlf
	0OhG+g5DpPFgWLezDBBCtvwpa8nqbW3p70DloinxxZQR6fKIOCKR6/OrAk3lvMNpXDRTgQ
	MluqKt8ABmVdeUa0T++Zkn8+yaX8jJg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-319-yYr_ORRCOJGjGRmoSMxsjw-1; Sun,
 20 Oct 2024 17:52:05 -0400
X-MC-Unique: yYr_ORRCOJGjGRmoSMxsjw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1934B19560B0
	for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 21:52:03 +0000 (UTC)
Received: from [172.64.5.43] (unknown [10.30.32.29])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B65001956086;
	Sun, 20 Oct 2024 21:52:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, c5522822)
Date: Sun, 20 Oct 2024 21:52:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <47403.124102017520500533@us-mta-319.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'char-misc-6.12-rc4' of git://git.kernel.org/=
pub/scm/linux/kernel/git/gregkh/char-misc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1504358807

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1504358807-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1504358807-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1504358807-x86_64-kernel-debug


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

