Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2931C687
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360047; cv=none; b=SwcHvgwaLI2q0yfJ794ccjJ7Xgw5ygZPycomWuTQ+GrhbicUd5t58ZJggo5aDyWQ1mCIWZO0xd6XciyIPyKhtIy1D+qBGZ0TItzIomitahgHfswoOlzIgXdeFmC5bFoZiUwNnqPkGavV8OZFqzbH6TNcv/VCjaHrbhQkq/53ZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360047; c=relaxed/simple;
	bh=nL5gAn4BFLLZx/mhxnvz/fjK6WIbGxhIz/6k+7KNffw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DBjDuadODTsiMqONaLc29YSrHtznPmTP1zlqMtgduA4nLe5GkYhEjScOzsIRT40qD/tAtJhMIQYhRW1cxDd5Ub8xUtznnSLe8tTOKXZD1DbmvoOgAS33BC+rV9yqSGHRmnhIhQrT00Se/WxrGLaoBkL8y1ZZAhhXfRJdUicaXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/HRQhsY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/HRQhsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HkGMWz6SC7OzieuUmTexNFb7zeg6XVGcTFywJzxRUZs=;
	b=M/HRQhsY1wubPyPyyA0aRarV/tjJNRYR+iOlDWwd9dkZ3ygxrcsuZSPhqYeZczZExOyTR8
	pJq5vGn14us877HoEztp1GU3R6++BC/1oUooGORFB7gqzdMmedwQ1j1c7/3q9A6xO/dyRy
	sJFSQkRTSGuhyGEf5jRNjVNmLbNphd0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-4ZneTN12PI-hGLFSvkJuog-1; Thu,
 26 Sep 2024 10:14:03 -0400
X-MC-Unique: 4ZneTN12PI-hGLFSvkJuog-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F39D81955DB1
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:02 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A0C0E1954B0F;
	Thu, 26 Sep 2024 14:14:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 88264981)
Date: Thu, 26 Sep 2024 14:14:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <24465.124092610140400196@us-mta-668.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.12' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1463481929

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463481929-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463481929-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1463481929-x86_64-kernel-debug


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

