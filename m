Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729AC18A952
	for <llvm@lists.linux.dev>; Sun,  6 Oct 2024 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728250389; cv=none; b=gClHJM5B9u6qsA3O1A6qxw9JhntX8Hh6L611/4bX/hDT/ZyGF3SuSICXqc3nQ09Bm0S+06c46OTHFhUFFSnUODmFzqGNAeO+g7SdvYEt1YS8YTf8VvQ8wcd2AJFodkogArevnbEwCbtdqAPJcQpzwGu6tqgvbwF2cYaqEb8Zp6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728250389; c=relaxed/simple;
	bh=fAZ8RoF9KBCdhK6aWnCTyllvL3279ptSVF0dwlDzh1I=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=bGxk8RrLwxGLRUO6a+f7Wuf4hGMTDud4iJFj91m5YxYnOuOFWwa2RfcmZQz5CC24M0fL5n/vamlS84UIYeLEudR+oql8AXjA4drlBOaBPnzF17TdQP5evhd/HVHhU96MRvDbKNgQfdRa/f7jDXYdhm+j9Qvh5SbxIN1HhMrbhaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e0/Qluqr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e0/Qluqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728250386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5eIgMYJAmZwFMQrsDbCZLCIOaSvGFw1hWd2g6It5EsU=;
	b=e0/QluqrIwviK03km+0igbcMwYWy9SwUiJOuWMMGqtIv3re0kgkKUk0IkbYCxPG8wynd4O
	jUBdjkvbHvuvbwuDVH4GDnHtT9Zy8exh4jyb9bzFbhcU85tDXeH3ZWbmsQW4bwjmzbxogL
	9hWF9PzsEAWMTBUum3oViJUOuNcUruw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-100-hDqsmzgFP-6jBe9-iByxIQ-1; Sun,
 06 Oct 2024 17:33:04 -0400
X-MC-Unique: hDqsmzgFP-6jBe9-iByxIQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED64219560A2
	for <llvm@lists.linux.dev>; Sun,  6 Oct 2024 21:33:03 +0000 (UTC)
Received: from [172.64.3.39] (unknown [10.30.33.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9515619560A3;
	Sun,  6 Oct 2024 21:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc1,
 mainline.kernel.org-clang, 2a130b7e)
Date: Sun, 06 Oct 2024 21:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <72460.124100617330400485@us-mta-100.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-fixes-v6.12' of git://git.kernel.org/=
pub/scm/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1483658988

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1483658988-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1483658988-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1483658988-x86_64-kernel-debug


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

