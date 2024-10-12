Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C38F40
	for <llvm@lists.linux.dev>; Sat, 12 Oct 2024 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728693188; cv=none; b=MJdVUKuGruyH0mS4GOpWryysiJjgxE29N5jYiibeQakZWvY+q3LKDibAmW82n3+/g6FAMAR1YohOdebPhBI3rjwsihdY0AR78HrtHByu2S60+yQ/F02A6f24EpyFOz6LHbAKDXeYI4l57GE93Lw8nMd4LdNXLgKV5T6CSi0wUow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728693188; c=relaxed/simple;
	bh=78rtQ1foA2+80z9CFKC6ZiG3OKd0J4EJ3hliquCmRNM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KefPtKDFk3tKadie/4uQQo33TOCvimIDa8+3fKPynWdVepCZZi++ZCA2Yygxo/spLFLv/vciPU1wIHVI0tDdsMcr+UDD3S4qwsMudd5pY5H0t2z0C0nM7UcwFY9iewVRP7Mv22qMI4yQMoOOXZE33G2WlQFIEG57E36c6eilof8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JR6O7KPw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JR6O7KPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728693185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yNxqYv2MKDt+3wHfGaMwhKjeU5lBI3m0nOUvh2p9eBA=;
	b=JR6O7KPwiPKDJA7FVQOZbGApSVim4epYZdJU5dpwJUfCR0to64BtcXViamzKQhN5RrRCel
	hpo2h5m0ZFuLjjEkJ8v5Vh4LvTAAlqusYipTClxNiBu6UM/Sd6xpYwoPV/78DyY4j/heyf
	wn0oaD5giWbp4jhXt7W5P2gMrqBi/GU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-FLUVhBlnPBS7Pwhb69A1tQ-1; Fri,
 11 Oct 2024 20:33:03 -0400
X-MC-Unique: FLUVhBlnPBS7Pwhb69A1tQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D925E19560A2
	for <llvm@lists.linux.dev>; Sat, 12 Oct 2024 00:33:02 +0000 (UTC)
Received: from [172.64.0.80] (unknown [10.30.33.131])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 639BA1956052;
	Sat, 12 Oct 2024 00:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc2,
 mainline.kernel.org-clang, 09f6b0c8)
Date: Sat, 12 Oct 2024 00:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <89168.124101120330301408@us-mta-658.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'linux_kselftest-fixes-6.12-rc3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1492669318

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1492669318-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1492669318-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1492669318-x86_64-kernel-debug


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

