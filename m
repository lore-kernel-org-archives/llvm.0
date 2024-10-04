Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FB38C13
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 01:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728006731; cv=none; b=p4lnfOl0X/D6Q8865pXgjjttf6YTgS4k+o9+zEQje/FxKreWO/eI/xW8p1CUd3KBqp0QxUc3Yj7uT15m1wf1CDZg4WrnTFc1VcC47T9GbraS3y+waUjfb1WjJ3fADFdpv5D4LwlY+C86OjL7u4Xv0C+/PeERQxh8RyH9Eq/A2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728006731; c=relaxed/simple;
	bh=ZsEVCPvC3NDeTmKXeo9cSUid7JAF4lOjwbjE9c5TTZQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Y24U1ypacjxEO/uHiD7bhBVG5cNd1NZYos+hYRokZsLAmjViryjRWWFIOu6EGKXNcHv8eMh1dxMpxlPavoNArEwvTRXi8MYmQmKI6RaocVcOLNll5ZTp9qgR+HhBht5WMFpJbqrpgIkf+edcxJJg/5HGpjv+4kuBKBPIqu9tD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmX2GBqb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmX2GBqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728006727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3B0ugv+ihkZqHHMGeULJ8UJ6evmiqyoAjOrzqwYIgjI=;
	b=cmX2GBqb/N1eK9idwOvyGqPipd0qQrJ84NWjDhCw2k0TcsGWkfzgOIwIUK5opaBQG5Kvq7
	ZMWnD4TBcsOxXTqfIQAn4C/Y15HVnQChjMvXcgBf5KVZlc+d4Ml5gugu320Ujc3kfJ4lZX
	qL5IN3EA/OHiHvpcGObtXovkbhFBKJU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-SGonQZsZOjaSQSBuP2fh8A-1; Thu,
 03 Oct 2024 21:52:05 -0400
X-MC-Unique: SGonQZsZOjaSQSBuP2fh8A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D502F19560BD
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 01:52:04 +0000 (UTC)
Received: from [172.64.3.39] (unknown [10.30.33.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45C0619560A3;
	Fri,  4 Oct 2024 01:52:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc1,
 mainline.kernel.org-clang, 0c559323)
Date: Fri, 04 Oct 2024 01:52:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <82640.124100321520600377@us-mta-111.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-fixes-6.12' of https://github.com/Rust-=
for-Linux/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1481092954

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1481092954-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1481092954-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1481092954-x86_64-kernel-debug


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

