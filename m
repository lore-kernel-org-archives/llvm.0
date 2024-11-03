Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AC140E5F
	for <llvm@lists.linux.dev>; Sun,  3 Nov 2024 19:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730663588; cv=none; b=ZJPAGjBtQeReO7PGErcNxvewM0TUOE08cbpKxBiNv3I8khGLpi3pa8DMehZRORYxEzLHUJ+ClDHZu3NkhBmGZWGDfKNV3PpntQUprDPWBdGFhRlLEi5EC1Ic9Frre8UTuvaSzQB6wAJOlRImeUImKOjd6PXwvnVh6DzrfSS1qIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730663588; c=relaxed/simple;
	bh=tyolftkF6D4o79OItN0de7F1MpcdAGRut7NAQ33totU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mR9bVrehYgUBjs7HxJ8QEU2ciionIEys5YF7fP32EvslMILhynGFz11/xMLnx1cBO3v4fFp9x0kGj8UWp5Ai/N8jZyMC8G2zKx6imi9NOGGQ1k/jr/kbFQx8R9/lIwJG3w+DxwChiT86ZNdO7sbJ0wpeoRPxL8oIMXVb5j7Sci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bP3ncg17; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bP3ncg17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730663585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qyyBzTj9a5tIGAnLb9N2nhHn/oaXRFZJ6lc1ewHBPfA=;
	b=bP3ncg17hhVB64xYkWSHBTrSGZ8YAO1RUI2tNe4GU0PV88ZnEBAmlSskawlfqUI7q2MTnM
	uiPzO6pM5IQKYpJPn/i1gtrcuU/NmypNXCX8LZ0MoIhj5xErE915W+GdrHeSRyEbAiqESW
	p5IKp7RPP9Usom+9rmPz4b4nhmrxh5o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-2ZkLEjfmP-eL4YAViLfkXA-1; Sun,
 03 Nov 2024 14:53:04 -0500
X-MC-Unique: 2ZkLEjfmP-eL4YAViLfkXA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 356001956088
	for <llvm@lists.linux.dev>; Sun,  3 Nov 2024 19:53:03 +0000 (UTC)
Received: from [172.64.2.75] (unknown [10.30.34.59])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A3CAB1956089;
	Sun,  3 Nov 2024 19:53:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc5,
 upstream-mainline, a33ab3f9)
Date: Sun, 03 Nov 2024 19:53:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <71529.124110314530400176@us-mta-622.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-fixes-v6.12-2' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1525092327

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525092327-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525092327-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1525092327-x86_64-kernel-debug


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

