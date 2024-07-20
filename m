Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8CC132
	for <llvm@lists.linux.dev>; Sat, 20 Jul 2024 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721454734; cv=none; b=Mm6Mv5FelsMRMrbMzV0F+zZ3SAkOv9Gvc5lKSkiCa4QfBplke/1zZP5mGi2Q9IMrnRdfIIANzXnYnw1+Rh//554B9FsbjJOFUuzTkTRirT0GbgrASsIDUk2GEBx2lKkSjYaMpZw09re0Z4rwkGbhHpWs0eqAXywYW9vshMgH3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721454734; c=relaxed/simple;
	bh=I7aK+hNftUPBnX8frZttfmzLaOPjRl23sD2+e3gyDFI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=IT5puac5GoGrX8yRvXtDLFzbA97nOPrQiJdUcKKAe/MNsp8+TAJnx13wF9BvXA+RYnYKwY9M01qKdP5PmTGx/qLakxFnw6gt4pq/pXPTSB67ZLiyAVe5L3ZHXrwSiytgH1r9qXcnVwkjA6o/BhUHpeJIrYCv/0kBZ+wgTtP/PHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8DHUOxP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8DHUOxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721454731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Qe9lhjfnhMWMp/hLS7xGniH0mrvRCSMwCaMJ4MEJ2Y=;
	b=D8DHUOxPIz/ohHSYRutOQ/zK0rI1z2bPZpjO00EnkVOjsfmZwxnt2mAcoDRO84wBvrU/Om
	ffvVLll6so9RD33XUhKVCWaMljpBJtLSOX0LCXIeI+dhe8+Cx4bGezLeNq9UoiR+p0sbSG
	8oJTBIG2GcbjtXSH79CGvn/7J0T5mSU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-270-hEWsGuRCPzG98EHtmCE6zw-1; Sat,
 20 Jul 2024 01:52:07 -0400
X-MC-Unique: hEWsGuRCPzG98EHtmCE6zw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B130A1955F0D
	for <llvm@lists.linux.dev>; Sat, 20 Jul 2024 05:52:06 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4B09195605A;
	Sat, 20 Jul 2024 05:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 3f386cb8)
Date: Sat, 20 Jul 2024 05:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <68961.124072001520700287@us-mta-270.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v6.11-changes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1381155670

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1381155670-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1381155670-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1381155670-x86_64-kernel-debug


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

