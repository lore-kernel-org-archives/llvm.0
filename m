Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D317189BA3
	for <llvm@lists.linux.dev>; Sun,  3 Nov 2024 21:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730670130; cv=none; b=XdY0QNVl1DAWY/kWnSRHfmmGuwdIHOgVsPkCCCi2zfLCDUHnD/D8YnQm+jdptfW6qr0znKQsaujI6/oxjrc5gKkiNlLv2DbEigvnv0Wf5vYCz6ohK54gZnKFsWsXovPahUyngGus7KmYAYJR8pkgl/6lnRYab89f92Ix+HbDWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730670130; c=relaxed/simple;
	bh=ek6ZOqbbN+3qwtXz/eMXkyZuk8lMqA7YyOtFi5fsAGI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=U1TaT2kvFP9YI98LdtwIH6NJE3svqD1EiQGr7KVa+/LL1zQhigq3BnKRzCCn/UEFBQ8U+Ia2bPztZzntqv7b4JZ8r+Hvjo/Xe1TkHFn1i/Pll6C+/kkAukreW7W0/lStRCDF0Sd7nOQFsWHzoCur5qNVLLpcUk1X7/QomEHh6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBzjsdzv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBzjsdzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730670127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N+DdHdc+q3cYPEuDdpKWBhs9lD+wQqhB26VosABqJcg=;
	b=NBzjsdzvA17sFFa241vDOSLS6ld1larXpDQuLhtJPO5zQ95yD1UfJIxK101RbmEwnPqaXF
	xFeNIiUi6mGA4g3AtrfDOqSMX/aikiLICGb3mIhGE2XzBNGGgZhk0Yra5GaWYSjD+x77XX
	k7c19irk+gCJgVnqJHG1hfFg32Q4Tbk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-X_NjMAt-MNihjAlEtuRWAw-1; Sun,
 03 Nov 2024 16:42:06 -0500
X-MC-Unique: X_NjMAt-MNihjAlEtuRWAw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2CEBD1956083
	for <llvm@lists.linux.dev>; Sun,  3 Nov 2024 21:42:05 +0000 (UTC)
Received: from [172.64.2.75] (unknown [10.30.34.59])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CAD221956086;
	Sun,  3 Nov 2024 21:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc5,
 upstream-mainline, d5aaa0bc)
Date: Sun, 03 Nov 2024 21:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <38526.124110316420600283@us-mta-558.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'phy-fixes-6.12' of git://git.kernel.org/pub/=
scm/linux/kernel/git/phy/linux-phy

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1525137479

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525137479-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525137479-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1525137479-x86_64-kernel-debug


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

