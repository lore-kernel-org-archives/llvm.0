Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633C1BC067
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830190; cv=none; b=JbNzzOt2qehDHs3W5TbzTfAfe24y5uOGvrXcMSvLaeh52VXFXfQoNhV6cT1BknuAPGEpyYRII9z2t0srUTqqlrFWnV5jfCKMuM7ECEHhvIsq0YgV6SxbHtGmKR+sM5Derp1W2hH/fwqd6fyjRX6WK0lADdAkihfOan0ohwUaDCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830190; c=relaxed/simple;
	bh=LDQa8uVLzYABHtdeGA2y5lbcn2nqFdXUy4+R3OQbwCU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qtVrCkp8J7ukoVYPo7aunjb/8yjc06yx0q4qFO6ZsRZLjpa/Uno18h4Mp3657ThOaeCKjZcv2BqUqfz7zc1BgmeTPJBO3tC//dWWmn4DaQthqA43mQtL2amtOHwoHXaxXRrI3S3+Gafp8kr0KllK/SqVostZ9ZuH2zjui5nXnos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsNX80SB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsNX80SB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723830187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XKwsKxrfDKHEANpKXl3Yh8yUsR5PlbZWvh3SBg4HuWk=;
	b=WsNX80SBg1BLRwHVQ/noP7585IMQ5E3waQ1Fiu8vhHcsL5nAY3/M8FqUn00fknozaRy0h0
	DiUpbeuw0gMuf0ApnG2LL8cdMI74hYQa22DzAkH2E3KW6AaLi7ZAjAm/trD5IphUTlcCCC
	LR+sjUslcQbWWk4IQBAW3uIpyqEREs0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-3GyUxoTRNWqd8BytGpS2qQ-1; Fri,
 16 Aug 2024 13:43:06 -0400
X-MC-Unique: 3GyUxoTRNWqd8BytGpS2qQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C72B19560AB
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 17:43:05 +0000 (UTC)
Received: from [172.64.15.52] (unknown [10.30.34.46])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 953841956054;
	Fri, 16 Aug 2024 17:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc3,
 mainline.kernel.org-clang, 670c12ce)
Date: Fri, 16 Aug 2024 17:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <71705.124081613430600906@us-mta-589.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.11/dm-fixes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/device-mapper/linux-dm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1416300125

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1416300125-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1416300125-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1416300125-x86_64-kernel-debug


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

