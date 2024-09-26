Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F5146D6B
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361121; cv=none; b=S1ySjUl70VGQsjmJSIyCkPb1WuDChAUsQFsdBN0pjmG+H89kbij3ZwyTVwX5zmG73vjaAXDy45sEucPpPr7EXBI3qf0y5nUYboprDpfr5cbOyU0b5JQACde1GVWBXB6q1ZTneuJuY+iu0O0mYi0xYIvxxcqWOdk/Utnu8kihT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361121; c=relaxed/simple;
	bh=F09D4DN/Tp1joK/jgFX/VxRm2AUMLDucf4dXPiALko4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FkzhnGbLTcUm69P4dXX2tKhLKdS10RjoigdPjRyae8IbsK6AEKqnipGAVRboowdagqPWJiikqcR4bpJB+yBUPm2HeEtCabkDS3X+EZqy9dOtOXc9oIIvQ6RUneq+ikKxldEsTVU3xaa748vB/tWbygDxVucaQqu0dOwoAtZU4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=creScyY3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="creScyY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727361118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MdmacNmcV3OFYA1iI7E+yr+zwMwSCFKob/Bd6I8z9XA=;
	b=creScyY3gPsftdaJXWVOYyfmX6c49IA1puZm8ZztA5eUZXyQwh2aRUR25DXA/YxCY5/3gw
	CLXpHDrNUx7i/Q9XabvgZji7oC0mAgY9iZ4wyoCpAYOkHSI6yTKCuH1s2OMNuJgA1iVCk6
	Offfxu6l+UTSfCSEWt+Xc9Ez1VKliOo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-S9TGs5B9MxC2wshFTj2GWQ-1; Thu,
 26 Sep 2024 10:31:56 -0400
X-MC-Unique: S9TGs5B9MxC2wshFTj2GWQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E797D19371E5
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:54 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B5371955DC7;
	Thu, 26 Sep 2024 14:31:54 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc5,
 mainline.kernel.org-clang, 1b5fe536)
Date: Thu, 26 Sep 2024 14:31:54 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <79737.124092610315602215@us-mta-401.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'execve-v6.11-rc6' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kees/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1432941309

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1432941309-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1432941309-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1432941309-x86_64-kernel-debug


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

