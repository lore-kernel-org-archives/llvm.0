Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3F11E1E04
	for <llvm@lists.linux.dev>; Sat, 10 May 2025 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746902534; cv=none; b=f1wnpjrWF0opGDFO5iKOl+UD3f5muOmSYJw6XHgSUfehW80g276IXRC7ZEAFKoxE7dyvmBD5jseJ5a5mmYXP2+J420LxGgjLnT9uH/+CSL2VBlx2YKPMx5KMnNHhq1wlW7XG3Lf/tPmvvARNiZwqJY3Tlw3/PH9J6ZwdLFms2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746902534; c=relaxed/simple;
	bh=OEWIGVncowFNZ2csyA+Tjn3fylFGdtPj1ILNi5cJinI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=TmG3J+AswTcwMcN1UM+jqE2Y91fnMWSWGTzqtk/C+GqQ7Fxn5Rf/sP/R4Z3V01XJmfWKfHoDXsCnJ8THB0LwCMyOEx7JH68RxMJO5AEGk0WAqmqWPh0xJVH72TeYf+O1nh3KARS2DoHVFPheF5IcOoYKrlj6nIPbHqSmED0ap7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IPwowPLw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IPwowPLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746902528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rtu76ntv3oLalkNguwuW/2XDxqbz2ucNbEPLdo8nZhk=;
	b=IPwowPLwcUWI61ouCcL+JGB+3gYHcbAgDYL3we2t/lCQ2ZgvkGAmK4P8fsNghAMw8McIsW
	EwcAk6ssrnmFhy+wEmV9MpDqjWctgUlQwHB5ShYTD6VfJhAb8UjKvJZ+GSkO/ALqwaxd4Z
	0tnaDX6LKOTBFad8XDWKz9SwQ7S3sX8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-bVt9wR0TMrmgLTO0Bjv2HA-1; Sat,
 10 May 2025 14:42:07 -0400
X-MC-Unique: bVt9wR0TMrmgLTO0Bjv2HA-1
X-Mimecast-MFC-AGG-ID: bVt9wR0TMrmgLTO0Bjv2HA_1746902526
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 07FCB180045C
	for <llvm@lists.linux.dev>; Sat, 10 May 2025 18:42:06 +0000 (UTC)
Received: from [172.20.110.75] (unknown [10.30.44.189])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 850031953B8B;
	Sat, 10 May 2025 18:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, bec6f00f)
Date: Sat, 10 May 2025 18:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <18715.125051014420700183@us-mta-149.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cBvtJgDKIiQqcRQ5_DEmEqJrJTHhvYaKgBlIgj1Ipe0_1746902526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'usb-6.15-rc6' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/gregkh/usb

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1810975883

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1810975883-x86_64-kernel-debug


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

