Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3A1F0E46
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738268532; cv=none; b=RadM3tWZUnW/QK5OoIZ9YYEVe7skfB3PKQfoR97gWLoIBRoFmH0Eb4T/8RDhP5Dh2O/fY/qBwWbSj7TrCEh02KlRHMdkRwxtSa6O32tSROkVzYuGxbtcMIc5+6JqfxWF5wFVxuEwMv5POQLP7i5fRKnYaRCqLGaG8fBcF5oPUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738268532; c=relaxed/simple;
	bh=CEoPSewTq8dBEjEXm06A/ldthQCpCZz4+4qxxmpxubA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lG2CFtCejyRSJtSfh7D0U7LVleXAXM4+OyD3hSzhwWYrWJYZKJk3zLxAsx+B8ioMB26gcYmdcotBnC+JaODug6cqUErcz3LnyfPWF0ufztB1v7KYpwbaXAh3AOTY/dLwWMHwPa2x/PjYiTjuPk61+A122kcZ7x9AWhN+73fRwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+MptiUW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+MptiUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738268528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jR75i6cAuk1uoUPd9V1cM4oNLjED+r/ioUfsB8HwUUI=;
	b=I+MptiUWnLkxPAAsHJT2z/l/ziQXJkRhKFeXms9mgB2MKKaaaVoVvomBZFLM6uycOBZ35M
	X3kiZIxeDvgMnryt+SdcQetd9ZxlG1rF/hdlffxzAkDINrUv1myMIEEs1XOoyOz1vV3z1z
	oGNozhXRfSujus6hZ40/6t/B/mVHzKs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-DwRZVW45OJef2z9yApSCIw-1; Thu,
 30 Jan 2025 15:22:07 -0500
X-MC-Unique: DwRZVW45OJef2z9yApSCIw-1
X-Mimecast-MFC-AGG-ID: DwRZVW45OJef2z9yApSCIw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 413F91956080
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 20:22:06 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BFFF01800268;
	Thu, 30 Jan 2025 20:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, b4b08811)
Date: Thu, 30 Jan 2025 20:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <43544.125013015220703083@us-mta-471.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yxOHjwjqjRfuKlzTjuuQWkqkAAUqv1N2DwqrCOes6qo_1738268526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'docs-6.14-2' of git://git.lwn.net/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1649111880

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1649111880-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1649111880-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1649111880-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

