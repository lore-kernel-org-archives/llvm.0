Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DC13A265
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 02:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744164729; cv=none; b=Bt43mcd9y9PSi7sdyW1YiPX7EaUBlRBanBfrceswZ8qOVUVb6um9AUU688zbE4Op24MCMR7aJzWs9hF1yV7dO+XSpj6I38RgzoOOVefO1blvnDPtUzawNShstnG52sMjDTbTHtsm6Pcdjvw5Gcj1Hv+Yn1i/5Qt8Y16/GbiP9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744164729; c=relaxed/simple;
	bh=ceQYaQkN9uSkQAkfKJB8Q+WgeOSRIqFI5dv0RmLA210=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GV0XBurV+gnmj6JlcZ8pVR3GZbQPUJscqJvktQI/bRBvf5r0CubpV8AQbuyeL8ESW51ZhSaeml/CIucQb6BccSQnEKN8Uhh3kSEVfrD2TL35FilBZHE3u3gFaCBbb0RKZcT6CpkVCbS+T2JKUHqzZhA6w4KOONGt6aQllsH9hgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B/ryWlzw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B/ryWlzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744164726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pt9feSX3mKMogzy7KImmpnybyMgCvTl+vAx2Ncy8mVA=;
	b=B/ryWlzwrUBmuzZmbCRuoqRN0gLgPPhTlEAw2JEjinFsieUfuhXH5mg/fLiiqoNSAs9Nze
	yZchvZm9hduw3+hdUwrTjnC89mdd5EGH+kRNYKsZpL5rrkDEYb2pC08eCaqyNX/LhcluFC
	VBu8eO42gU1Y8maw5UzJbO7JGXC4cso=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-PQmkA34yOkGli1c3Lo9H7A-1; Tue,
 08 Apr 2025 22:12:04 -0400
X-MC-Unique: PQmkA34yOkGli1c3Lo9H7A-1
X-Mimecast-MFC-AGG-ID: PQmkA34yOkGli1c3Lo9H7A_1744164724
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25D331800257
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 02:12:04 +0000 (UTC)
Received: from [172.20.65.13] (unknown [10.30.44.73])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B5C05180174E;
	Wed,  9 Apr 2025 02:12:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, a2458824)
Date: Wed, 09 Apr 2025 02:12:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <91442.125040822120500271@us-mta-584.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tRlEQsUJ1tFHx0y59d3PaFyukw15eTJd-rA6a89tmfU_1744164724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'linux_kselftest-kunit-6.15-rc2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1759186414

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1759186414-x86_64-kernel-debug


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

